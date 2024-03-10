use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Subs;
use GTK::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Subs;

sub ease (Int() $ease, Num() $value) {
  my AdwEasing $e = $ease;
  my gdouble   $v = $value;

  adw_easing_ease($e, $v);
}

sub from_px (
  Int()         $unit,
  Num()         $value,
  GtkSettings() $settings
)
  is export
{
  my AdwLengthUnit $u = $unit;
  my gdouble       $v = $value;

  adw_length_unit_from_px($u, $value, $settings);
}

sub to_px (
  Int()         $unit,
  Num()         $value,
  GtkSettings() $settings
)
  is export
{
  my AdwLengthUnit $u = $unit;
  my gdouble       $v = $value;

  adw_length_unit_to_px($unit, $value, $settings);
}


### /usr/src/libadwaita-1-1.3~alpha/src/adw-easing.h

sub adw_easing_ease (
  AdwEasing $self,
  gdouble   $value
)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub ADW-writeTypeToManifest(
  \O,
  $file   = '',
  $f      = "type-manifest.json",
) {
  writeTypeToManifest(O, $file, $f, prefix => adwaita-prefix);
}

### /usr/src/libadwaita/src/adw-length-unit.h

sub adw_length_unit_from_px (
  AdwLengthUnit $unit,
  gdouble       $value,
  GtkSettings   $settings
)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_length_unit_to_px (
  AdwLengthUnit $unit,
  gdouble       $value,
  GtkSettings   $settings
)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }
