use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Breakpoint::Bin;

### /usr/src/libadwaita/src/adw-breakpoint-bin.h

sub adw_breakpoint_bin_add_breakpoint (
  AdwBreakpointBin $self,
  AdwBreakpoint    $breakpoint
)
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_bin_get_child (AdwBreakpointBin $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_bin_get_current_breakpoint (AdwBreakpointBin $self)
  returns AdwBreakpoint
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_bin_new
  returns AdwBreakpointBin
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_bin_remove_breakpoint (
  AdwBreakpointBin $self,
  AdwBreakpoint    $breakpoint
)
  is      native(adwaita)
  is      export
{ * }

sub adw_breakpoint_bin_set_child (
  AdwBreakpointBin $self,
  GtkWidget        $child
)
  is      native(adwaita)
  is      export
{ * }
