use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Action::Row;

use Adwaita::Preferences::Row;

use GLib::Roles::Implementor;

our subset AdwActionRowAncestry is export of Mu
  where AdwActionRow | AdwPreferencesRowAncestry;

class Adwaita::Action::Row is Adwaita::Preferences::Row {
  has AdwActionRow $!adw-ar is implementor;

  submethod BUILD ( :$adw-action-row ) {
    self.setAdwActionRow($adw-action-row) if $adw-action-row
  }

  method setAdwActionRow (AdwActionRowAncestry $_) {
    my $to-parent;

    $!adw-ar = do {
      when AdwActionRow {
        $to-parent = cast(AdwPreferencesRow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwActionRow, $_);
      }
    }
    self.setAdwPreferencesRow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwActionRow
    is also<AdwActionRow>
  { $!adw-ar }

  multi method new (
    $adw-action-row where * ~~ AdwActionRowAncestry,

    :$ref = True
  ) {
    return unless $adw-action-row;

    my $o = self.bless( :$adw-action-row );
    $o.ref if $ref;
    $o;
  }
  multi method new (*%a) {
    my $adw-action-row = adw_action_row_new();

    my $o = $adw-action-row ?? self.bless( :$adw-action-row ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # GtkWidget
  method activatable-widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<activatable_widget>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('activatable-widget', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('activatable-widget', $gv);
      }
    );
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

  # Type: int
  method subtitle-lines is rw  is g-property is also<subtitle_lines> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('subtitle-lines', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('subtitle-lines', $gv);
      }
    );
  }

  # Type: int
  method title-lines is rw  is g-property is also<title_lines> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title-lines', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('title-lines', $gv);
      }
    );
  }

  method Activated {
    self.connect($!adw-ar, 'activated');
  }

  method activate {
    adw_action_row_activate($!adw-ar);
  }

  method add_prefix (GtkWidget() $widget) is also<add-prefix> {
    #self.insertBuildableChild(1, $widget);
    adw_action_row_add_prefix($!adw-ar, $widget);
  }

  method add_suffix (GtkWidget() $widget)
    is also<
      add-suffix
      append
      add_child
      add-child
    >
  {
    #self.addBuildableChild($widget)
    adw_action_row_add_suffix($!adw-ar, $widget);
  }

  method get_activatable_widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-activatable-widget>
  {
    returnProperWidget(
      adw_action_row_get_activatable_widget($!adw-ar),
      $raw,
      $proper
    );
  }

  method get_icon_name is also<get-icon-name> {
    adw_action_row_get_icon_name($!adw-ar);
  }

  method get_subtitle is also<get-subtitle> {
    adw_action_row_get_subtitle($!adw-ar);
  }

  method get_subtitle_lines is also<get-subtitle-lines> {
    adw_action_row_get_subtitle_lines($!adw-ar);
  }

  method get_title_lines is also<get-title-lines> {
    adw_action_row_get_title_lines($!adw-ar);
  }

  method remove (GtkWidget() $widget) {
    #self.removeBuildableChild($widget);
    adw_action_row_remove($!adw-ar, $widget);
  }

  method set_activatable_widget (GtkWidget() $widget)
    is also<set-activatable-widget>
  {
    #self.setBuildableWidget(0, $widget);
    adw_action_row_set_activatable_widget($!adw-ar, $widget);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    adw_action_row_set_icon_name($!adw-ar, $icon_name);
  }

  method set_subtitle (Str() $subtitle) is also<set-subtitle> {
    adw_action_row_set_subtitle($!adw-ar, $subtitle);
  }

  method set_subtitle_lines (Int() $subtitle_lines)
    is also<set-subtitle-lines>
  {
    my gint $s = $subtitle_lines;

    adw_action_row_set_subtitle_lines($!adw-ar, $s);
  }

  method set_title_lines (Int() $title_lines) is also<set-title-lines> {
    my gint $t = $title_lines;

    adw_action_row_set_title_lines($!adw-ar, $t);
  }

}
