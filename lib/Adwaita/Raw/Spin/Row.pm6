use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Enums:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Spin::Row;

### /usr/src/libadwaita/src/adw-spin-row.h

sub adw_spin_row_configure (
  AdwSpinRow    $self,
  GtkAdjustment $adjustment,
  gdouble       $climb_rate,
  guint         $digits
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_adjustment (AdwSpinRow $self)
  returns GtkAdjustment
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_climb_rate (AdwSpinRow $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_digits (AdwSpinRow $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_numeric (AdwSpinRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_snap_to_ticks (AdwSpinRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_update_policy (AdwSpinRow $self)
  returns GtkSpinButtonUpdatePolicy
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_value (AdwSpinRow $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_get_wrap (AdwSpinRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_new (
  GtkAdjustment $adjustment,
  gdouble       $climb_rate,
  guint         $digits
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_new_with_range (
  gdouble $min,
  gdouble $max,
  gdouble $step
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_adjustment (
  AdwSpinRow    $self,
  GtkAdjustment $adjustment
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_climb_rate (
  AdwSpinRow $self,
  gdouble    $climb_rate
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_digits (
  AdwSpinRow $self,
  guint      $digits
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_numeric (
  AdwSpinRow $self,
  gboolean   $numeric
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_range (
  AdwSpinRow $self,
  gdouble    $min,
  gdouble    $max
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_snap_to_ticks (
  AdwSpinRow $self,
  gboolean   $snap_to_ticks
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_update_policy (
  AdwSpinRow                $self,
  GtkSpinButtonUpdatePolicy $policy
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_value (
  AdwSpinRow $self,
  gdouble    $value
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_set_wrap (
  AdwSpinRow $self,
  gboolean   $wrap
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spin_row_update (AdwSpinRow $self)
  is      native(adwaita)
  is      export
{ * }
