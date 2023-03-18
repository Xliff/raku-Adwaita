use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Subs;

sub ease (Int() $ease, Num() $value) {
  my AdwEasing $e = $ease;
  my gdouble   $v = $value;

  adw_easing_ease($e, $v);
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
