use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Expander::Row;

### /usr/src/libadwaita-1-1.2.0/src/adw-expander-row.h

sub adw_expander_row_add_action (
  AdwExpanderRow $self,
  GtkWidget      $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_add_prefix (
  AdwExpanderRow $self,
  GtkWidget      $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_add_row (
  AdwExpanderRow $self,
  GtkWidget      $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_get_enable_expansion (AdwExpanderRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_get_expanded (AdwExpanderRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_get_icon_name (AdwExpanderRow $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_get_show_enable_switch (AdwExpanderRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_get_subtitle (AdwExpanderRow $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_new
  returns AdwExpanderRow
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_remove (
  AdwExpanderRow $self,
  GtkWidget      $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_set_enable_expansion (
  AdwExpanderRow $self,
  gboolean       $enable_expansion
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_set_expanded (
  AdwExpanderRow $self,
  gboolean       $expanded
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_set_icon_name (
  AdwExpanderRow $self,
  Str            $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_set_show_enable_switch (
  AdwExpanderRow $self,
  gboolean       $show_enable_switch
)
  is      native(adwaita)
  is      export
{ * }

sub adw_expander_row_set_subtitle (
  AdwExpanderRow $self,
  Str            $subtitle
)
  is      native(adwaita)
  is      export
{ * }
