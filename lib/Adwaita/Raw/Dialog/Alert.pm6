use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Dialog::Alert;

### /usr/src/libadwaita/src/adw-alert-dialog.h

sub adw_alert_dialog_add_response (
  AdwAlertDialog $self,
  Str            $id,
  Str            $label
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_add_responses (
  AdwAlertDialog $self,
  Str            $first_id
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_choose (
  AdwAlertDialog      $self,
  GtkWidget           $parent,
  GCancellable        $cancellable,
                      &callback (AdwAlertDialog, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_choose_finish (
  AdwAlertDialog $self,
  GAsyncResult   $result
)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_format_body (
  AdwAlertDialog $self,
  Str            $format,
  Str
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_format_body_markup (
  AdwAlertDialog $self,
  Str            $format,
  Str
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_format_heading (
  AdwAlertDialog $self,
  Str            $format,
  Str
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_format_heading_markup (
  AdwAlertDialog $self,
  Str            $format,
  Str
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_body (AdwAlertDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_body_use_markup (AdwAlertDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_close_response (AdwAlertDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_default_response (AdwAlertDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_extra_child (AdwAlertDialog $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_heading (AdwAlertDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_heading_use_markup (AdwAlertDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_response_appearance (
  AdwAlertDialog $self,
  Str            $response
)
  returns AdwResponseAppearance
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_response_enabled (
  AdwAlertDialog $self,
  Str            $response
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_get_response_label (
  AdwAlertDialog $self,
  Str            $response
)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_has_response (
  AdwAlertDialog $self,
  Str            $response
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_new (
  Str $heading,
  Str $body
)
  returns AdwDialog
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_remove_response (
  AdwAlertDialog $self,
  Str            $id
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_body (
  AdwAlertDialog $self,
  Str            $body
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_body_use_markup (
  AdwAlertDialog $self,
  gboolean       $use_markup
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_close_response (
  AdwAlertDialog $self,
  Str            $response
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_default_response (
  AdwAlertDialog $self,
  Str            $response
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_extra_child (
  AdwAlertDialog $self,
  GtkWidget      $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_heading (
  AdwAlertDialog $self,
  Str            $heading
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_heading_use_markup (
  AdwAlertDialog $self,
  gboolean       $use_markup
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_response_appearance (
  AdwAlertDialog        $self,
  Str                   $response,
  AdwResponseAppearance $appearance
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_response_enabled (
  AdwAlertDialog $self,
  Str            $response,
  gboolean       $enabled
)
  is      native(adwaita)
  is      export
{ * }

sub adw_alert_dialog_set_response_label (
  AdwAlertDialog $self,
  Str            $response,
  Str            $label
)
  is      native(adwaita)
  is      export
{ * }
