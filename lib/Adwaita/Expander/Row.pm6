use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Expander::Row;

use Adwaita::Preferences::Row;

our subset AdwExpanderRowAncestry is export of Mu
  where AdwExpanderRow | AdwPreferencesRowAncestry;

class Adwaita::Expander::Row is Adwaita::Preferences::Row {
  has AdwExpanderRow $!adw-er is implementor;

  submethod BUILD ( :$adw-expander-row ) {
    self.setAdwExpanderRow($adw-expander-row) if $adw-expander-row
  }

  method setAdwExpanderRow (AdwExpanderRowAncestry $_) {
    my $to-parent;

    $!adw-er = do {
      when AdwExpanderRow {
        $to-parent = cast(AdwPreferencesRow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwExpanderRow, $_);
      }
    }
    self.setAdwPreferencesRow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwExpanderRow
    is also<AdwExpanderRow>
  { $!adw-er }

  multi method new (
    $adw-expander-row where * ~~ AdwExpanderRowAncestry,

    :$ref = True
  ) {
    return unless $adw-expander-row;

    my $o = self.bless( :$adw-expander-row );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-expander-row = adw_expander_row_new();

    my $o = $adw-expander-row ?? self.bless( :$adw-expander-row ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method enable-expansion is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-expansion', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-expansion', $gv);
      }
    );
  }

  # Type: boolean
  method expanded is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('expanded', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('expanded', $gv);
      }
    );
  }

  # Type: string
  method icon-name is rw  is g-property {
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

  # Type: boolean
  method show-enable-switch is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-enable-switch', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-enable-switch', $gv);
      }
    );
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

  method add_action (GtkWidget() $widget) is also<add-action> {
    #self.addBuildableChild(type => 'action', $widget);
    adw_expander_row_add_action($!adw-er, $widget);
  }

  method add_prefix (GtkWidget() $widget) is also<add-prefix> {
    #self.addBuildableChild(type => 'prefix', $widget);
    adw_expander_row_add_prefix($!adw-er, $widget);
  }

  method add_row (GtkWidget() $child)
    is also<
      add-row
      append
      add-child
      add_child
    >
  {
    #self.addBuildableChild($child);
    adw_expander_row_add_row($!adw-er, $child);
  }

  method get_enable_expansion is also<get-enable-expansion> {
    so adw_expander_row_get_enable_expansion($!adw-er);
  }

  method get_expanded is also<get-expanded> {
    so adw_expander_row_get_expanded($!adw-er);
  }

  method get_icon_name is also<get-icon-name> {
    adw_expander_row_get_icon_name($!adw-er);
  }

  method get_show_enable_switch is also<get-show-enable-switch> {
    adw_expander_row_get_show_enable_switch($!adw-er);
  }

  method get_subtitle is also<get-subtitle> {
    adw_expander_row_get_subtitle($!adw-er);
  }

  method remove (GtkWidget() $child) {
    # cw: If :$type is not specified, will search ALL
    #self.removeBuildableChild($child);
    adw_expander_row_remove($!adw-er, $child);
  }

  method set_enable_expansion (Int() $enable_expansion)
    is also<set-enable-expansion>
  {
    adw_expander_row_set_enable_expansion($!adw-er, $enable_expansion);
  }

  method set_expanded (Int() $expanded) is also<set-expanded> {
    my gboolean $e = $expanded.so.Int;

    adw_expander_row_set_expanded($!adw-er, $e);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    adw_expander_row_set_icon_name($!adw-er, $icon_name);
  }

  method set_show_enable_switch (Int() $show_enable_switch)
    is also<set-show-enable-switch>
  {
    my gboolean $s = $show_enable_switch.so.Int;

    adw_expander_row_set_show_enable_switch($!adw-er, $s);
  }

  method set_subtitle (Str() $subtitle) is also<set-subtitle> {
    adw_expander_row_set_subtitle($!adw-er, $subtitle);
  }

}
