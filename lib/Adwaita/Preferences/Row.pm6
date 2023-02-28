use v6.c;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Preferences::Row;

use GTK::ListBox:ver<4>;

use GLib::Roles::Implementor;

our subset AdwPreferencesRowAncestry is export of Mu
  where AdwPreferencesRow | GtkListBoxRowAncestry;

class Adwaita::Preferences::Row is GTK::ListBox::Row:ver<4> {
  has AdwPreferencesRow $!adw-pr is implementor;

  submethod BUILD ( :$adw-preferences-row ) {
    self.setAdwPreferencesRow($adw-preferences-row)
      if $adw-preferences-row
  }

  method setAdwPreferencesRow (AdwPreferencesRowAncestry $_) {
    my $to-parent;

    $!adw-pr = do {
      when AdwPreferencesRow {
        $to-parent = cast(GtkListBoxRow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwPreferencesRow, $_);
      }
    }
    self.setGtkListBoxRow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwPreferencesRow
  { $!adw-pr }

  multi method new (
    $adw-preferences-row where * ~~ AdwPreferencesRowAncestry,

    :$ref = True
  ) {
    return unless $adw-preferences-row;

    my $o = self.bless( :$adw-preferences-row );
    $o.ref if $ref;
    $o;
  }
  multi method new (*%a) {
    my $adw-preferences-row = adw_preferences_row_new();

    my $o = $adw-preferences-row ?? self.bless( :$adw-preferences-row )
                                 !! Nil;
    $o.setAttributes(%a) if $o && +%a;
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
  method title-selectable is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title-selectable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('title-selectable', $gv);
      }
    );
  }

  # Type: boolean
  method use-markup is rw  is g-property {
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

  # Type: boolean
  method use-underline is rw  is g-property {
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

  method get_title {
    adw_preferences_row_get_title($!adw-pr);
  }

  method get_title_selectable {
    so adw_preferences_row_get_title_selectable($!adw-pr);
  }

  method get_use_markup {
    so adw_preferences_row_get_use_markup($!adw-pr);
  }

  method get_use_underline {
    so adw_preferences_row_get_use_underline($!adw-pr);
  }

  method set_title (Str() $title) {
    adw_preferences_row_set_title($!adw-pr, $title);
  }

  method set_title_selectable (Int() $title_selectable) {
    my gboolean $t = $title_selectable;

    adw_preferences_row_set_title_selectable($!adw-pr, $t);
  }

  method set_use_markup (Int() $use_markup) {
    my gboolean $u = $use_markup;

    adw_preferences_row_set_use_markup($!adw-pr, $u);
  }

  method set_use_underline (Int() $use_underline) {
    my gboolean $u = $use_underline;

    adw_preferences_row_set_use_underline($!adw-pr, $u);
  }

}
