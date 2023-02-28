use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Pango::Raw::Definitions;
use GTK::Raw::Enums:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Entry::Row;

### /usr/src/libadwaita-1-1.2.0/src/adw-entry-row.h

sub adw_entry_row_add_prefix (
  AdwEntryRow $self,
  GtkWidget   $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_add_suffix (
  AdwEntryRow $self,
  GtkWidget   $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_get_activates_default (AdwEntryRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_get_attributes (AdwEntryRow $self)
  returns PangoAttrList
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_get_enable_emoji_completion (AdwEntryRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_get_input_hints (AdwEntryRow $self)
  returns GtkInputHints
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_get_input_purpose (AdwEntryRow $self)
  returns GtkInputPurpose
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_get_show_apply_button (AdwEntryRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_remove (
  AdwEntryRow $self,
  GtkWidget   $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_set_activates_default (
  AdwEntryRow $self,
  gboolean    $activates
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_set_attributes (
  AdwEntryRow   $self,
  PangoAttrList $attributes
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_set_enable_emoji_completion (
  AdwEntryRow $self,
  gboolean    $enable_emoji_completion
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_set_input_hints (
  AdwEntryRow   $self,
  GtkInputHints $hints
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_set_input_purpose (
  AdwEntryRow     $self,
  GtkInputPurpose $purpose
)
  is      native(adwaita)
  is      export
{ * }

sub adw_entry_row_set_show_apply_button (
  AdwEntryRow $self,
  gboolean    $show_apply_button
)
  is      native(adwaita)
  is      export
{ * }

### /usr/src/libadwaita-1-1.2.0/src/adw-password-entry-row.h

sub adw_password_entry_row_new
  returns AdwPasswordEntryRow
  is      native(adwaita)
  is      export
{ * }
