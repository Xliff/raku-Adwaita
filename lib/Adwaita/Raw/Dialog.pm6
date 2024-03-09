use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Dialog;

### /usr/src/libadwaita/src/adw-dialog.h

sub adw_dialog_add_breakpoint (
  AdwDialog     $self,
  AdwBreakpoint $breakpoint
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_close (AdwDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_force_close (AdwDialog $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_can_close (AdwDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_child (AdwDialog $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_content_height (AdwDialog $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_content_width (AdwDialog $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_current_breakpoint (AdwDialog $self)
  returns AdwBreakpoint
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_default_widget (AdwDialog $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_focus (AdwDialog $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_follows_content_size (AdwDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_presentation_mode (AdwDialog $self)
  returns AdwDialogPresentationMode
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_get_title (AdwDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_new
  returns AdwDialog
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_present (
  AdwDialog $self,
  GtkWidget $parent
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_can_close (
  AdwDialog $self,
  gboolean  $can_close
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_child (
  AdwDialog $self,
  GtkWidget $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_content_height (
  AdwDialog $self,
  gint      $content_height
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_content_width (
  AdwDialog $self,
  gint      $content_width
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_default_widget (
  AdwDialog $self,
  GtkWidget $default_widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_focus (
  AdwDialog $self,
  GtkWidget $focus
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_follows_content_size (
  AdwDialog $self,
  gboolean  $follows_content_size
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_presentation_mode (
  AdwDialog                 $self,
  AdwDialogPresentationMode $presentation_mode
)
  is      native(adwaita)
  is      export
{ * }

sub adw_dialog_set_title (
  AdwDialog $self,
  Str       $title
)
  is      native(adwaita)
  is      export
{ * }
