use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use Adwaita::Action::Row;

use GLib::Roles::Implementor;

our subset AdwSwitchRowAncestry is export of Mu
  where AdwSwitchRow | AdwActionRowAncestry;

class Adwaita::Switch::Row is Adwaita::Action::Row {
  has AdwSwitchRow $!adw-sr is implementor;

  submethod BUILD ( :$adw-switch-row ) {
    self.setAdwSwitchRow($adw-switch-row) if $adw-switch-row
  }

  method setAdwSwitchRow (AdwSwitchRowAncestry $_) {
    my $to-parent;

    $!adw-sr = do {
      when AdwSwitchRow {
        $to-parent = cast(AdwActionRow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSwitchRow, $_);
      }
    }
    self.setAdwActionRow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSwitchRow
    is also<AdwSwitchRow>
  { $!adw-sr }

  multi method new (
     $adw-switch-row where * ~~ AdwSwitchRowAncestry,

    :$ref                                              = True
  ) {
    return unless $adw-switch-row;

    my $o = self.bless( :$adw-switch-row );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $adw-switch-row = adw_switch_row_new();

    $adw-switch-row ?? self.bless( :$adw-switch-row ) !! Nil;
  }

  # Type: boolean
  method active is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('active', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('active', $gv);
      }
    );
  }

  method get_active is also<get-active> {
    adw_switch_row_get_active($!adw-sr);
  }

  method set_active (Int() $is_active) is also<set-active> {
    my gboolean $i = $is_active.so.Int;

    adw_switch_row_set_active($!adw-sr, $is_active);
  }

}

### /usr/src/libadwaita/src/adw-switch-row.h

sub adw_switch_row_get_active (AdwSwitchRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_switch_row_new
  returns AdwSwitchRow
  is      native(adwaita)
  is      export
{ * }

sub adw_switch_row_set_active (
  AdwSwitchRow $self,
  gboolean     $is_active
)
  is      native(adwaita)
  is      export
{ * }
