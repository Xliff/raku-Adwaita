use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Button::Content;

use GTK::Widget:ver<4>;

our subset AdwButtonContentAncestry is export of Mu
  where AdwButtonContent | GtkWidgetAncestry;

class Adwaita::Button::Content is GTK::Widget:ver<4> {
  has AdwButtonContent $!adw-bc is implementor;

  submethod BUILD ( :$adw-button-content ) {
    self.setAdwButtonContent($adw-button-content) if $adw-button-content
  }

  method setAdwButtonContent (AdwButtonContentAncestry $_) {
    my $to-parent;

    $!adw-bc = do {
      when AdwButtonContent {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwButtonContent, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwButtonContent
    is also<AdwButtonContent>
  { $!adw-bc }

  multi method new (
    $adw-button-content where * ~~ AdwButtonContentAncestry,

    :$ref = True
  ) {
    return unless $adw-button-content;

    my $o = self.bless( :$adw-button-content );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-button-content = adw_button_content_new();

    my $o = $adw-button-content ?? self.bless( :$adw-button-content ) !! Nil;
    $o.setAttributes(%a);
    $o;
  }

  # Type: string
  method icon-name is rw  is g-property is also<icon_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('icon-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('icon-name', $gv);
      }
    );
  }

  # Type: string
  method label is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('label', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('label', $gv);
      }
    );
  }

  # Type: boolean
  method use-underline is rw  is g-property is also<use_underline> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-underline', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-underline', $gv);
      }
    );
  }

  method get_icon_name is also<get-icon-name> {
    adw_button_content_get_icon_name($!adw-bc);
  }

  method get_label is also<get-label> {
    adw_button_content_get_label($!adw-bc);
  }

  method get_use_underline is also<get-use-underline> {
    adw_button_content_get_use_underline($!adw-bc);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    adw_button_content_set_icon_name($!adw-bc, $icon_name);
  }

  method set_label (Str() $label) is also<set-label> {
    adw_button_content_set_label($!adw-bc, $label);
  }

  method set_use_underline (Int() $use_underline) is also<set-use-underline> {
    my gboolean $u = $use_underline.so.Int;

    adw_button_content_set_use_underline($!adw-bc, $u);
  }

}
