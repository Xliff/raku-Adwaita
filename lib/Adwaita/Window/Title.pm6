use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwWindowTitleAncestry is export of Mu
  where AdwWindowTitle | GtkWidgetAncestry;

class Adwaita::Window::Title is GTK::Widget:ver<4> {
  has AdwWindowTitle $!adw-wt is implementor;

  submethod BUILD ( :$adw-window-title ) {
    self.setAdwWindowTitle($adw-window-title)
      if $adw-window-title
  }

  method setAdwWindowTitle (AdwWindowTitleAncestry $_) {
    my $to-parent;

    $!adw-wt = do {
      when AdwWindowTitle {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwWindowTitle, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwWindowTitle
    is also<AdwWindowTitle>
  { $!adw-wt }

  multi method new (
    $adw-window-title where * ~~ AdwWindowTitleAncestry,

    :$ref = True
  ) {
    return unless $adw-window-title;

    my $o = self.bless( :$adw-window-title );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $title, Str() $subtitle) {
    adw_window_title_new($title, $subtitle);
  }
  multi method new ( *%a ) {
    my $t  = %a<title>:delete    // '';
    my $st = %a<sibtitle>:delete // '';

    my $adw_window_title = samewith($t, $st);

    my $o = $adw_window_title ?? self.bless( :$adw_window_title )
                              !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: string
  method subtitle is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('subtitle', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('subtitle', $gv);
      }
    );
  }

  # Type: string
  method title is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('title', $gv);
      }
    );
  }

  method get_subtitle is also<get-subtitle> {
    adw_window_title_get_subtitle($!adw-wt);
  }

  method get_title is also<get-title> {
    adw_window_title_get_title($!adw-wt);
  }

  method set_subtitle (Str() $subtitle) is also<set-subtitle> {
    adw_window_title_set_subtitle($!adw-wt, $subtitle);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_window_title_set_title($!adw-wt, $title);
  }

}

### /usr/src/libadwaita-1-1.3~alpha/src/adw-window-title.h

sub adw_window_title_get_subtitle (AdwWindowTitle $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_window_title_get_title (AdwWindowTitle $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_window_title_new (
  Str $title,
  Str $subtitle
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_window_title_set_subtitle (
  AdwWindowTitle $self,
  Str            $subtitle
)
  is      native(adwaita)
  is      export
{ * }

sub adw_window_title_set_title (
  AdwWindowTitle $self,
  Str            $title
)
  is      native(adwaita)
  is      export
{ * }
