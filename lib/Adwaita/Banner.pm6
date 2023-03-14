use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Banner;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwBannerAncestry is export of Mu
  where AdwBanner | GtkWidgetAncestry;

class Adwaita::Banner is GTK::Widget:ver<4> {
  has AdwBanner $!adw-b is implementor;

  submethod BUILD ( :$adw-banner ) {
    self.setAdwBanner($adw-banner) if $adw-banner
  }

  method setAdwBanner (AdwBannerAncestry $_) {
    my $to-parent;

    $!adw-b = do {
      when AdwBanner {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwBanner, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwBanner
    is also<AdwBanner>
  { $!adw-b }

  proto method new (|)
  { * }

  multi method new (
    $adw-banner where * ~~ AdwBannerAncestry,

    :$ref = True
  ) {
    return unless $adw-banner;

    my $o = self.bless( :$adw-banner );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $title, *%a ) {
    my $adw-banner = adw_banner_new($title);

    my $o = $adw-banner ?? self.bless( :$adw-banner ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }
  multi method new ( *%a ) {
    my $title = %a<title>:delete;

    samewith($title // '', |%a);
  }

  # Type: string
  method button-label is rw  is g-property is also<button_label> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('button-label', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('button-label', $gv);
      }
    );
  }

  # Type: boolean
  method revealed is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('revealed', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('revealed', $gv);
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

  # Type: boolean
  method use-markup is rw  is g-property is also<use_markup> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-markup', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-markup', $gv);
      }
    );
  }

  method Button-Clicked is also<Button_Clicked> {
    self.connect($!adw-b, 'button-clicked');
  }

  method get_button_label is also<get-button-label> {
    adw_banner_get_button_label($!adw-b);
  }

  method get_revealed is also<get-revealed> {
    so adw_banner_get_revealed($!adw-b);
  }

  method get_title is also<get-title> {
    adw_banner_get_title($!adw-b);
  }

  method get_use_markup is also<get-use-markup> {
    so adw_banner_get_use_markup($!adw-b);
  }

  method set_button_label (Str() $label) is also<set-button-label> {
    adw_banner_set_button_label($!adw-b, $label);
  }

  method set_revealed (Int() $revealed) is also<set-revealed> {
    my gboolean $r = $revealed.so.Int;

    adw_banner_set_revealed($!adw-b, $r);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_banner_set_title($!adw-b, $title);
  }

  method set_use_markup (Int() $use_markup) is also<set-use-markup> {
    my gboolean $u = $use_markup.so.Int;

    adw_banner_set_use_markup($!adw-b, $u);
  }

}
