use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Clamp::Scrollable;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-clamp-scrollable.h

sub adw_clamp_scrollable_get_child (AdwClampScrollable $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_scrollable_get_maximum_size (AdwClampScrollable $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_scrollable_get_tightening_threshold (AdwClampScrollable $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_scrollable_new
  returns AdwClampScrollable
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_scrollable_set_child (
  AdwClampScrollable $self,
  GtkWidget          $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_scrollable_set_maximum_size (
  AdwClampScrollable $self,
  gint               $maximum_size
)
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_scrollable_set_tightening_threshold (
  AdwClampScrollable $self,
  gint               $tightening_threshold
)
  is      native(adwaita)
  is      export
{ * }
