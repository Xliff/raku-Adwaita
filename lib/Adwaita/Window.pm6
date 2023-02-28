use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Window:ver<4>;

use GLib::Roles::Implementor;

our subset AdwWindowAncestry is export of Mu
  where AdwWindow | GtkWindowAncestry;

class Adwaita::Window is GTK::Window:ver<4> {
  has AdwWindow $!adw-w is implementor;

  submethod BUILD ( :$adw-window ) {
    self.setAdwWindow($adw-window) if $adw-window
  }

  method setAdwWindow (AdwWindowAncestry $_) {
    my $to-parent;

    $!adw-w = do {
      when AdwWindow {
        $to-parent = cast(GtkWindow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwWindow, $_);
      }
    }
    self.setGtkWindow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwWindow
    is also<AdwWindow>
  { $!adw-w }

  multi method new (
    $adw-window where * ~~ AdwWindowAncestry,

    :$ref = True
  ) {
    return unless $adw-window;

    my $o = self.bless( :$adw-window );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-window = adw_window_new();

    my $o = $adw-window ?? self.bless( :$adw-window ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  method titlebar {
    warn "Calls to AdwWindow.set_titlebar are not supported for stability {
          ''} reasons!";
  }

  method child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
  {
    warn "All calls to AdwWindow.child are redirected to {
          ''} AdwWindow.content!";
    self.content(:$raw, :$proper);
  }

  # Type: AdwWidget
  method content (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( GTK::Widget );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('content', $gv);
      }
    );
  }

  method get_titlebar (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  ) 
    is also<get-titlebar>
  {
    warn "All calls to AdwWindow.titlebar are redirected to {
          ''} AdwWindow.content!";
    self.get_content(:$raw, :$proper);
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  ) 
    is also<get-child>
  {
    warn "All calls to AdwWindow.child are redirected to {
          ''} AdwWindow.content!";
    self.get_content(:$raw, :$proper);
  }

  method get_content (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  ) 
    is also<get-content>
  {
    returnProperWidget(
      adw_window_get_content($!adw-w),
      $raw,
      $proper
    );
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    warn "All calls to AdwWindow.child are redirected to {
          ''} AdwWindow.content!";
    self.set_content($child);
  }

  method set_content (GtkWidget() $content) is also<set-content> {
    #self.setBuildableChild(0, $content);
    adw_window_set_content($!adw-w, $content);
  }

  method set_titlebar ($tb) is also<set-titlebar> {
    warn "Calls to AdwWindow.set_titlebar are not supported for stability {
          ''} reasons!";
  }

}

### /usr/src/libadwaita-1-1.2.0/src/adw-window.h

sub adw_window_get_content (AdwWindow $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_window_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_window_set_content (
  AdwWindow $self,
  GtkWidget $content
)
  is      native(adwaita)
  is      export
{ * }
