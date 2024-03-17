use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Spin::Row;

use GTK::Adjustment;
use Adwaita::Action::Row;

use GLib::Roles::Implementor;

our subset AdwSpinRowAncestry is export of Mu
  where AdwSpinRow | AdwActionRowAncestry;

class Adwaita::Spin::Row is Adwaita::Action::Row {
  has AdwSpinRow $!adw-sr is implementor;

  submethod BUILD ( :$adw-spin-row ) {
    self.setAdwSpinRow($adw-spin-row) if $adw-spin-row
  }

  method setAdwSpinRow (AdwSpinRowAncestry $_) {
    my $to-parent;

    $!adw-sr = do {
      when AdwSpinRow {
        $to-parent = cast(AdwActionRow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSpinRow, $_);
      }
    }
    self.setAdwActionRow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSpinRow
    is also<AdwSpinRow>
  { $!adw-sr }

  multi method new (
     $adw-spin-row where * ~~ AdwSpinRowAncestry,

    :$ref                                         = True
  ) {
    return unless $adw-spin-row;

    my $o = self.bless( :$adw-spin-row );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    GtkAdjustment() $adjustment,
    Num()           $climb_rate,
    Int()           $digits
  ) {
    my gdouble $c = $climb_rate;
    my guint   $d = $digits;

    my $adw-spin-row = adw_spin_row_new($adjustment, $c, $d);

    $adw-spin-row ?? self.bless( :$adw-spin-row ) !! Nil;
  }

  method new_with_range (Num() $min, Num() $max, Num() $step)
    is also<new-with-range>
  {
    my ($mn, $mx, $s) = ($min, $max, $step);

    adw_spin_row_new_with_range($!adw-sr, $mn, $mx, $s);
  }

  # Type: GtkAdjustment
  method adjustment ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::Adjustment.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('adjustment', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::Adjustment.getTypePair
        );
      },
      STORE => -> $, GtkAdjustment() $val is copy {
        $gv.object = $val;
        self.prop_set('adjustment', $gv);
      }
    );
  }

  # Type: double
  method climb-rate is rw  is g-property is also<climb_rate> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('climb-rate', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('climb-rate', $gv);
      }
    );
  }

  # Type: uint
  method digits is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('digits', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('digits', $gv);
      }
    );
  }

  # Type: boolean
  method numeric is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('numeric', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('numeric', $gv);
      }
    );
  }

  # Type: boolean
  method snap-to-ticks is rw  is g-property is also<snap_to_ticks> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('snap-to-ticks', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('snap-to-ticks', $gv);
      }
    );
  }

  # Type: GtkSpinButtonUpdatePolicy
  method update-policy ( :$enum = True )
    is rw
    is g-property
    is also<update_policy>
  {
    my $gv = GLib::Value.new( GTK::Enum::GtkSpinButtonUpdatePolicy.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('update-policy', $gv);
        my $p = $gv.enum;
        return $p unless $enum;
        GtkSpinButtonUpdatePolicyEnum($p);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GtkSpinButtonUpdatePolicy) = $val;
        self.prop_set('update-policy', $gv);
      }
    );
  }

  # Type: double
  method value is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('value', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('value', $gv);
      }
    );
  }

  # Type: boolean
  method wrap is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('wrap', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('wrap', $gv);
      }
    );
  }

  method Input {
    self.connect-pdouble($!adw-sr, 'input');
  }

  method Output {
    self.connect($!adw-sr, 'output');
  }

  method Wrapped {
    self.connect($!adw-sr, 'wrapped');
  }

  method configure (
    GtkAdjustment() $adjustment,
    Num()           $climb_rate,
    Int()           $digits
  ) {
    my gdouble $c = $climb_rate;
    my guint   $d = $digits;

    adw_spin_row_configure($!adw-sr, $adjustment, $c, $d);
  }

  method get_adjustment ( :$raw = False ) is also<get-adjustment> {
    propReturnObject(
      adw_spin_row_get_adjustment($!adw-sr),
      $raw,
      |GTK::Adjustment.getTypePair
    );
  }

  method get_climb_rate is also<get-climb-rate> {
    adw_spin_row_get_climb_rate($!adw-sr);
  }

  method get_digits is also<get-digits> {
    adw_spin_row_get_digits($!adw-sr);
  }

  method get_numeric is also<get-numeric> {
    adw_spin_row_get_numeric($!adw-sr);
  }

  method get_snap_to_ticks is also<get-snap-to-ticks> {
    adw_spin_row_get_snap_to_ticks($!adw-sr);
  }

  method get_update_policy is also<get-update-policy> {
    adw_spin_row_get_update_policy($!adw-sr);
  }

  method get_value is also<get-value> {
    adw_spin_row_get_value($!adw-sr);
  }

  method get_wrap is also<get-wrap> {
    adw_spin_row_get_wrap($!adw-sr);
  }

  method set_adjustment (GtkAdjustment() $adjustment) is also<set-adjustment> {
    adw_spin_row_set_adjustment($!adw-sr, $adjustment);
  }

  method set_climb_rate (Int() $climb_rate) is also<set-climb-rate> {
    my gdouble $c = $climb_rate;

    adw_spin_row_set_climb_rate($!adw-sr, $c);
  }

  method set_digits (Int() $digits) is also<set-digits> {
    my guint $d = $digits;

    adw_spin_row_set_digits($!adw-sr, $d);
  }

  method set_numeric (Int() $numeric) is also<set-numeric> {
    my gboolean $n = $numeric.so.Int;

    adw_spin_row_set_numeric($!adw-sr, $n);
  }

  method set_range (Num() $min, Num() $max) is also<set-range> {
    my ($mn, $mx) = ($min, $max);

    adw_spin_row_set_range($!adw-sr, $mn, $mx);
  }

  method set_snap_to_ticks (Int() $snap_to_ticks) is also<set-snap-to-ticks> {
    my gboolean  $s = $snap_to_ticks.so.Int;

    adw_spin_row_set_snap_to_ticks($!adw-sr, $s);
  }

  method set_update_policy (Int() $policy) is also<set-update-policy> {
    my GtkSpinButtonUpdatePolicy $p = $policy;

    adw_spin_row_set_update_policy($!adw-sr, $p);
  }

  method set_value (Num() $value) is also<set-value> {
    my gdouble $v = $value;

    adw_spin_row_set_value($!adw-sr, $v);
  }

  method set_wrap (Int() $wrap) is also<set-wrap> {
    my gboolean $w = $wrap.so.Int;

    adw_spin_row_set_wrap($!adw-sr, $w);
  }

  method update {
    adw_spin_row_update($!adw-sr);
  }

}
