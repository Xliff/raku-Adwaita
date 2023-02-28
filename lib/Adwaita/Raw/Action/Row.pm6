use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Action::Row;

### /usr/src/libadwaita-1-1.2.0/src/adw-action-row.h

sub adw_action_row_activate (AdwActionRow $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_add_prefix (
  AdwActionRow $self,
  GtkWidget    $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_add_suffix (
  AdwActionRow $self,
  GtkWidget    $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_get_activatable_widget (AdwActionRow $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_get_icon_name (AdwActionRow $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_get_subtitle (AdwActionRow $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_get_subtitle_lines (AdwActionRow $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_get_title_lines (AdwActionRow $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_remove (
  AdwActionRow $self,
  GtkWidget    $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_set_activatable_widget (
  AdwActionRow $self,
  GtkWidget    $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_set_icon_name (
  AdwActionRow $self,
  Str          $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_set_subtitle (
  AdwActionRow $self,
  Str          $subtitle
)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_set_subtitle_lines (
  AdwActionRow $self,
  gint         $subtitle_lines
)
  is      native(adwaita)
  is      export
{ * }

sub adw_action_row_set_title_lines (
  AdwActionRow $self,
  gint         $title_lines
)
  is      native(adwaita)
  is      export
{ * }
