use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Combo::Row;

use Adwaita::Action::Row;

use GTK::Expression:ver<4>;
use GTK::List::Item::Factory:ver<4>;
use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwComboRowAncestry is export of Mu
  where AdwComboRow | AdwActionRowAncestry;

class Adwaita::Combo::Row is Adwaita::Action::Row {
  has AdwComboRow $!adw-pr is implementor;

  submethod BUILD ( :$adw-combo-row ) {
    self.setAdwComboRow($adw-combo-row) if $adw-combo-row
  }

  method setAdwComboRow (AdwComboRowAncestry $_) {
    my $to-parent;

    $!adw-pr = do {
      when AdwComboRow {
        $to-parent = cast(AdwActionRow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwComboRow, $_);
      }
    }
    self.setAdwActionRow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwComboRow
    is also<AdwComboRow>
  { $!adw-pr }

  multi method new (
    $adw-combo-row where * ~~ AdwComboRowAncestry,

    :$ref = True
  ) {
    return unless $adw-combo-row;

    my $o = self.bless( :$adw-combo-row );
    $o.ref if $ref;
    $o;
  }
  multi method new (*%a) {
    my $adw-combo-row = adw_combo_row_new();

    my $o = $adw-combo-row ?? self.bless( :$adw-combo-row ) !! Nil;
    $o.setAttributes(%a);
    $o;
  }

  # Type: GtkListItemFactory
  method expression ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::Expression.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('expression', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::Expression.getTypePair
        );
      },
      STORE => -> $, GtkExpression() $val is copy {
        $gv.object = $val;
        self.prop_set('expression', $gv);
      }
    );
  }

  # Type: GtkListItemFactory
  method factory ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::List::Item::Factory.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('factory', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::List::Item::Factory.getTypePair
        );
      },
      STORE => -> $, GtkListItemFactory() $val is copy {
        $gv.object = $val;
        self.prop_set('factory', $gv);
      }
    );
  }

  # Type: GtkListItemFactory
  method list-factory ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::List::Item::Factory.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('list-factory', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::List::Item::Factory.getTypePair
        );
      },
      STORE => -> $, GtkListItemFactory() $val is copy {
        $gv.object = $val;
        self.prop_set('list-factory', $gv);
      }
    );
  }

  # Type: GListModel
  method model ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GIO::ListModel.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('model', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GIO::ListModel.getTypePair
        );
      },
      STORE => -> $, GListModel() $val is copy {
        $gv.object = $val;
        self.prop_set('model', $gv);
      }
    );
  }

  # Type: uint
  method selected is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selected', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('selected', $gv);
      }
    );
  }

  # Type: GObject (nee Pointer)
  method selected-item is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selected-item', $gv);
        $gv.pointer;
      },
      STORE => -> $,  $val is copy {
        warn 'selected-item does not allow writing'
      }
    );
  }

  # Type: boolean
  method use-subtitle is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-subtitle', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-subtitle', $gv);
      }
    );
  }

  method get_expression ( :$raw = False ) is also<get-expression> {
    propReturnObject(
      adw_combo_row_get_expression($!adw-pr),
      $raw,
      |GTK::Expression.getTypePair
    );
  }

  method get_factory (:$raw = False ) is also<get-factory> {
    propReturnObject(
      adw_combo_row_get_factory($!adw-pr),
      $raw,
      |GTK::List::Item::Factory.getTypePair
    );
  }

  method get_list_factory (:$raw = False ) is also<get-list-factory> {
    propReturnObject(
      adw_combo_row_get_list_factory($!adw-pr),
      $raw,
      |GTK::List::Item::Factory.getTypePair
    );
  }

  method get_model ( :$raw = False ) is also<get-model> {
    propReturnObject(
      adw_combo_row_get_model($!adw-pr),
      $raw,
      |GIO::ListModel.getTypePair
    );
  }

  method get_selected is also<get-selected> {
    adw_combo_row_get_selected($!adw-pr);
  }

  method get_selected_item is also<get-selected-item> {
    adw_combo_row_get_selected_item($!adw-pr);
  }

  method get_use_subtitle is also<get-use-subtitle> {
    so adw_combo_row_get_use_subtitle($!adw-pr);
  }

  method set_expression (GtkExpression() $expression) is also<set-expression> {
    adw_combo_row_set_expression($!adw-pr, $expression);
  }

  method set_factory (GtkListItemFactory() $factory) is also<set-factory> {
    adw_combo_row_set_factory($!adw-pr, $factory);
  }

  method set_list_factory (GtkListItemFactory() $factory)
    is also<set-list-factory>
  {
    adw_combo_row_set_list_factory($!adw-pr, $factory);
  }

  method set_model (GListModel()  $model) is also<set-model> {
    adw_combo_row_set_model($!adw-pr, $model);
  }

  method set_selected (Int() $position) is also<set-selected> {
    my guint $p = $position;

    adw_combo_row_set_selected($!adw-pr, $position);
  }

  method set_use_subtitle (Int() $use_subtitle) is also<set-use-subtitle> {
    my gboolean $u = $use_subtitle;

    adw_combo_row_set_use_subtitle($!adw-pr, $u);
  }

}
