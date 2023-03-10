use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Preferences::Page;

use GTK::Widget:ver<4>;
use Adwaita::ListModel::Enum;

use GLib::Roles::Implementor;

our subset AdwPreferencesPageAncestry is export of Mu
  where AdwPreferencesPage | GtkWidgetAncestry;

class Adwaita::Preferences::Page is GTK::Widget:ver<4> {
  has AdwPreferencesPage $!adw-pp is implementor;

  submethod BUILD ( :$adw-pref-page ) {
    self.setAdwPreferencesPage($adw-pref-page) if $adw-pref-page
  }

  method setAdwPreferencesPage (AdwPreferencesPageAncestry $_) {
    my $to-parent;

    $!adw-pp = do {
      when AdwPreferencesPage {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwPreferencesPage, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }
  method Adwaita::Raw::Definitions::AdwPreferencesPage
    is also<AdwPreferencePage>
  { $!adw-pp }

  multi method new (
    $adw-pref-page where * ~~ AdwPreferencesPageAncestry,

    :$ref = True
  ) {
    return unless $adw-pref-page;

    my $o = self.bless( :$adw-pref-page );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-pref-page = adw_preferences_page_new();

    my $o = $adw-pref-page ?? self.bless( :$adw-pref-page ) !! Nil;
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
  method name is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('name', $gv);
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

  method add (AdwPreferencesGroup() $group) {
    adw_preferences_page_add($!adw-pp, $group);
  }

  method get_icon_name is also<get-icon-name> {
    adw_preferences_page_get_icon_name($!adw-pp);
  }

  method get_name is also<get-name> {
    adw_preferences_page_get_name($!adw-pp);
  }

  method get_title is also<get-title> {
    adw_preferences_page_get_title($!adw-pp);
  }

  method get_use_underline is also<get-use-underline> {
    so adw_preferences_page_get_use_underline($!adw-pp);
  }

  method remove (AdwPreferencesGroup() $group) {
    adw_preferences_page_remove($!adw-pp, $group);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    adw_preferences_page_set_icon_name($!adw-pp, $icon_name);
  }

  method set_name (Str() $name) is also<set-name> {
    adw_preferences_page_set_name($!adw-pp, $name);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_preferences_page_set_title($!adw-pp, $title);
  }

  method set_use_underline (Int() $use_underline) is also<set-use-underline> {
    my gboolean $u = $use_underline.so.Int;

    adw_preferences_page_set_use_underline($!adw-pp, $u);
  }

}
