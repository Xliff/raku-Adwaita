use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Breakpoint;

### /usr/src/libadwaita/src/adw-breakpoint.h

sub adw_breakpoint_add_setter (
  AdwBreakpoint $self,
  GObject       $object,
  Str           $property,
  GValue        $value
)
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_add_settersv (
  AdwBreakpoint            $self,
  gint                     $n_setters,
  CArray[Pointer[GObject]] $objects,
  CArray[Str]              $names,
  CArray[GValue]           $values
)
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_copy (AdwBreakpointCondition $self)
  returns AdwBreakpointCondition
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_free (AdwBreakpointCondition $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_new_and (
  AdwBreakpointCondition $condition_1,
  AdwBreakpointCondition $condition_2
)
  returns AdwBreakpointCondition
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_new_length (
  AdwBreakpointConditionLengthType $type,
  gdouble                          $value,
  AdwLengthUnit                    $unit
)
  returns AdwBreakpointCondition
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_new_or (
  AdwBreakpointCondition $condition_1,
  AdwBreakpointCondition $condition_2
)
  returns AdwBreakpointCondition
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_new_ratio (
  AdwBreakpointConditionRatioType $type,
  gint                            $width,
  gint                            $height
)
  returns AdwBreakpointCondition
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_parse (Str $str)
  returns AdwBreakpointCondition
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_condition_to_string (AdwBreakpointCondition $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_get_condition (AdwBreakpoint $self)
  returns AdwBreakpointCondition
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_new (AdwBreakpointCondition $condition)
  returns AdwBreakpoint
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_set_condition (
  AdwBreakpoint          $self,
  AdwBreakpointCondition $condition
)
  is      native(adwaita)
  is      export
{ * }
