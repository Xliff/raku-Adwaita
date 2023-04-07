use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::ApplicationWindow:ver<4>;

use GLib::Roles::Implementor;

our subset AdwApplicationWindowAncestry is export of Mu
  where AdwApplicationWindow | GtkApplicationWindowAncestry;

class Adwaita::ApplicationWindow is GTK::ApplicationWindow:ver<4> {
  has AdwApplicationWindow $!adw-aw is implementor;

  submethod BUILD ( :$adw-application-window ) {
    self.setAdwApplicationWindow($adw-application-window)
      if $adw-application-window
  }

  method setAdwApplicationWindow (AdwApplicationWindowAncestry $_) {
    my $to-parent;

    $!adw-aw = do {
      when AdwApplicationWindow {
        $to-parent = cast(GtkApplicationWindow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwApplicationWindow, $_);
      }
    }
    self.setGtkApplicationWindow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwApplicationWindow
    is also<AdwApplicationWindow>
  { $!adw-aw }

  multi method new (
    $adw-application-window where * ~~ AdwApplicationWindowAncestry,

    :$ref = True
  ) {
    return unless $adw-application-window;

    my $o = self.bless( :$adw-application-window );
    $o.ref if $ref;
    $o;
  }
  multi method new (GtkApplication() $app) {
    my $adw-application-window = adw_application_window_new($app);

    $adw-application-window ?? self.bless( :$adw-application-window ) !! Nil;
  }

  # Type: GtkWidget
  method content (
    :$raw           = False ,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
   )
     is rw
     is g-property
   {
     my $gv = GLib::Value.new( GTK::Widget.get_type );
     Proxy.new(
       FETCH => sub ($) {
         self.prop_get('content', $gv);
         returnProperWidget(
           $gv.object,
           $raw,
           $proper
         )
       },
       STORE => -> $, GtkWidget() $val is copy {
         $gv.object = $val;
         self.prop_set('content', $gv);
       }
     );
  }

  method get_content (
    :$raw           = False ,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
   )
    is also<get-content>
  {
    returnProperWidget(
      adw_application_window_get_content($!adw-aw),
      $raw,
      $proper
    )
  }

  method set_content (GtkWidget() $content) is also<set-content> {
    adw_application_window_set_content($!adw-aw, $content);
  }

}

### /usr/src/libadwaita-1-1.3~alpha/src/./adw-application-window.h

sub adw_application_window_get_content (AdwApplicationWindow $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_application_window_new (GtkApplication $app)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_application_window_set_content (
  AdwApplicationWindow $self,
  GtkWidget            $content
)
  is      native(adwaita)
  is      export
{ * }
