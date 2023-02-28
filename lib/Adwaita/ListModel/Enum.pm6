use v6.c;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::ListModel::Enum;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use GIO::Roles::ListModel;

our subset AdwEnumListModelAncestry is export of Mu
  where AdwEnumListModel | GListModel | GObject;

class Adwaita::ListModel::Enum {
  also does GLib::Roles::Object;
  also does GIO::Roles::ListModel;

  has AdwEnumListModel $!adw-elm is implementor;

  submethod BUILD ( :$adw-enum-model ) {
    self.setAdwEnumListModel($adw-enum-model) if $adw-enum-model
  }

  method setAdwEnumListModel (AdwEnumListModelAncestry $_) {
    my $to-parent;

    $!adw-elm = do {
      when AdwEnumListModel {
        $to-parent = cast(GObject, $_);
        $_;
      }

      when GListModel {
        $to-parent = cast(GObject, $_);
        $!lm       = $_;
        cast(AdwEnumListModel, $_);
      }

      default {
        $to-parent = $_;
        cast(AdwEnumListModel, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GListModel;
  }

  method Adwaita::Raw::Definitions::AdwEnumListModel
  { $!adw-elm }

  multi method new ($adw-enum-model where * ~~ AdwEnumListModelAncestry , :$ref = True) {
    return unless $adw-enum-model;

    my $o = self.bless( :$adw-enum-model );
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $type) {
    my GType $t = $type;

    my $adw-enum-model = adw_enum_list_model_new($t);

    $adw-enum-model ?? self.bless( :$adw-enum-model ) !! Nil;
  }

  # Type: AdwEnum
  method enum-type is rw  is g-property {
    my $gv = GLib::Value.new( GLib::Value.typeFromEnum(GType) );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enum-type', $gv);
        $gv.valueFromEnum(GType);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GType) = $val;
        self.prop_set('enum-type', $gv);
      }
    );
  }

  method find_position (Int() $value) {
    my gint $v = $value;

    adw_enum_list_model_find_position($!adw-elm, $v);
  }

  method get_enum_type {
    adw_enum_list_model_get_enum_type($!adw-elm);
  }

}


our subset AdwEnumListItemAncestry is export of Mu
  where AdwEnumListItem | GObject;

class Adwaita::ListModel::Enum::Item {
  also does GLib::Roles::Object;

  has AdwEnumListItem $!adw-eli is implementor;

  submethod BUILD ( :$adw-enum-model ) {
    self.setAdwEnumListItem($adw-enum-model)
      if $adw-enum-model
  }

  method setAdwEnumListItem (AdwEnumListItemAncestry $_) {
    my $to-parent;

    $!adw-eli = do {
      when AdwEnumListItem {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwEnumListItem, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwEnumListItem
  { $!adw-eli }

  multi method new ($adw-enum-model where * ~~ AdwEnumListItemAncestry , :$ref = True) {
    return unless $adw-enum-model;

    my $o = self.bless( :$adw-enum-model );
    $o.ref if $ref;
    $o;
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
        warn 'name does not allow writing'
      }
    );
  }

  # Type: string
  method nick is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('nick', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'nick does not allow writing'
      }
    );
  }

  # Type: int
  method value is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('value', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn 'value does not allow writing'
      }
    );
  }

  method get_name {
    adw_enum_list_item_get_name($!adw-eli);
  }

  method get_nick {
    adw_enum_list_item_get_nick($!adw-eli);
  }

  method get_value {
    adw_enum_list_item_get_value($!adw-eli);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_enum_list_item_get_type, $n, $t );
  }

}
