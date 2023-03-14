use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Button::Split;

use GIO::MenuModel;
use GTK::Popover:ver<4>;
use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwSplitButtonAncestry is export of Mu
  where AdwSplitButton | GtkWidgetAncestry;

class Adwaita::Button::Split is GTK::Widget:ver<4> {
  has AdwSplitButton $!adw-sb is implementor;

  submethod BUILD ( :$adw-split-button ) {
    self.setAdwSplitButton($adw-split-button) if $adw-split-button
  }

  method setAdwSplitButton (AdwSplitButtonAncestry $_) {
    my $to-parent;

    $!adw-sb = do {
      when AdwSplitButton {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSplitButton, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSplitButton
    is also<AdwSplitButton>
  { $!adw-sb }

  multi method new (
    $adw-split-button where * ~~ AdwSplitButtonAncestry,

    :$ref = True
  ) {
    return unless $adw-split-button;

    my $o = self.bless( :$adw-split-button );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-split-button = adw_split_button_new();

    my $o = $adw-split-button ?? self.bless( :$adw-split-button ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: AdwWidget
  method child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('child', $gv);
      }
    );
  }

  # Type: GtkArrowType
  method direction ( :$enum = False ) is rw  is g-property {
    my $gv = GLib::Value.new-enum( GtkArrowType );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('direction', $gv);
        my $t = $gv.enum;
        return $t unless $enum;
        GtkArrowTypeEnum($t);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GtkArrowType) = $val;
        self.prop_set('direction', $gv);
      }
    );
  }

  # Type: string
  method dropdown-tooltip
    is rw
    is g-property
    is also<dropdown_tooltip>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('dropdown-tooltip', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('dropdown-tooltip', $gv);
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

  # Type: GMenuModel
  method menu-model ( :$raw = False )
    is rw
    is g-property
    is also<menu_model>
  {
    my $gv = GLib::Value.new( GIO::MenuModel.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('menu-model', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GIO::MenuModel.getTypePair
        );
      },
      STORE => -> $, GMenuModel() $val is copy {
        $gv.object = $val;
        self.prop_set('menu-model', $gv);
      }
    );
  }

  # Type: GtkPopover
  method popover ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::Popover.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('popover', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::Popover.getTypePair
        );
      },
      STORE => -> $, GtkPopover() $val is copy {
        $gv.object = $val;
        self.prop_set('popover', $gv);
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

  method Activate {
    self.connect($!adw-sb, 'activate');
  }

  method Clicked {
    self.connect($!adw-sb, 'clicked');
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_split_button_get_child($!adw-sb),
      $raw,
      $proper
    );
  }

  method get_direction ( :$enum = False ) is also<get-direction> {
    my $d = adw_split_button_get_direction($!adw-sb);
    return $d unless $enum;
    GtkArrowTypeEnum($d);
  }

  method get_dropdown_tooltip is also<get-dropdown-tooltip> {
    adw_split_button_get_dropdown_tooltip($!adw-sb);
  }

  method get_icon_name is also<get-icon-name> {
    adw_split_button_get_icon_name($!adw-sb);
  }

  method get_label is also<get-label> {
    adw_split_button_get_label($!adw-sb);
  }

  method get_menu_model ( :$raw = False ) is also<get-menu-model> {
     propReturnObject(
       adw_split_button_get_menu_model($!adw-sb),
       $raw,
       |GIO::MenuModel.getTypePair
     );
  }

  method get_popover ( :$raw = False ) is also<get-popover> {
    propReturnObject(
      adw_split_button_get_popover($!adw-sb),
      $raw,
      |GTK::Popover.getTypePair
    );
  }

  method get_use_underline is also<get-use-underline> {
    so adw_split_button_get_use_underline($!adw-sb);
  }

  method popdown {
    adw_split_button_popdown($!adw-sb);
  }

  method popup {
    adw_split_button_popup($!adw-sb);
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    adw_split_button_set_child($!adw-sb, $child);
  }

  method set_direction (Int() $direction) is also<set-direction> {
    my GtkArrowType $d = $direction;

    adw_split_button_set_direction($!adw-sb, $d);
  }

  method set_dropdown_tooltip (Str() $tooltip)
    is also<set-dropdown-tooltip>
  {
    adw_split_button_set_dropdown_tooltip($!adw-sb, $tooltip);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    adw_split_button_set_icon_name($!adw-sb, $icon_name);
  }

  method set_label (Str() $label) is also<set-label> {
    adw_split_button_set_label($!adw-sb, $label);
  }

  method set_menu_model (GMenuModel() $menu_model)
    is also<set-menu-model>
  {
    adw_split_button_set_menu_model($!adw-sb, $menu_model);
  }

  method set_popover (GtkPopover() $popover) is also<set-popover> {
    adw_split_button_set_popover($!adw-sb, $popover);
  }

  method set_use_underline (Int() $use_underline)
    is also<set-use-underline>
  {
    my gboolean $u = $use_underline.so.Int;

    adw_split_button_set_use_underline($!adw-sb, $u);
  }

}
