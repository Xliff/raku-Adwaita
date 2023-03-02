use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Toast;

### /usr/src/libadwaita-1-1.2.0/src/adw-toast.h

sub adw_toast_dismiss (AdwToast $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_get_action_name (AdwToast $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_get_action_target_value (AdwToast $self)
  returns GVariant
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_get_button_label (AdwToast $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_get_custom_title (AdwToast $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_get_priority (AdwToast $self)
  returns AdwToastPriority
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_get_timeout (AdwToast $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_get_title (AdwToast $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_new (Str $title)
  returns AdwToast
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_new_format (Str $format, Str)
  returns AdwToast
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_action_name (AdwToast $self, Str $action_name)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_action_target (AdwToast $self, Str $format_string)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_action_target_value (
  AdwToast $self,
  GVariant $action_target
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_button_label (AdwToast $self, Str $button_label)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_custom_title (AdwToast $self, GtkWidget $widget)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_detailed_action_name (
  AdwToast $self,
  Str      $detailed_action_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_priority (AdwToast $self, AdwToastPriority $priority)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_timeout (AdwToast $self, guint $timeout)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_set_title (AdwToast $self, Str $title)
  is      native(adwaita)
  is      export
{ * }
