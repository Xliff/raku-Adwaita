use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Dialog::Message;

### /usr/src/libadwaita-1-1.3~alpha/src/./adw-message-dialog.h

sub adw_message_dialog_add_response (
  AdwMessageDialog $self,
  Str              $id,
  Str              $label
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_add_responses (
  AdwMessageDialog $self,
  Str              $first_id
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_choose (
  AdwMessageDialog    $self,
  GCancellable        $cancellable,
                      &callback (AdwMessageDialog, GAsyncResult, gboolean),
  gpointer            $user_data
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_choose_finish (
  AdwMessageDialog $self,
  GAsyncResult     $result
)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_format_body (
  AdwMessageDialog $self,
  Str              $format
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_format_body_markup (
  AdwMessageDialog $self,
  Str              $format
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_format_heading (
  AdwMessageDialog $self,
  Str              $format
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_format_heading_markup (
  AdwMessageDialog $self,
  Str              $format
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_body (AdwMessageDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_body_use_markup (AdwMessageDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_close_response (AdwMessageDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_default_response (AdwMessageDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_extra_child (AdwMessageDialog $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_heading (AdwMessageDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_heading_use_markup (AdwMessageDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_response_appearance (
  AdwMessageDialog $self,
  Str              $response
)
  returns AdwResponseAppearance
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_response_enabled (
  AdwMessageDialog $self,
  Str              $response
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_response_label (
  AdwMessageDialog $self,
  Str              $response
)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_has_response (
  AdwMessageDialog $self,
  Str              $response
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_new (
  GtkWindow $parent,
  Str       $heading,
  Str       $body
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_response (
  AdwMessageDialog $self,
  Str              $response
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_body (
  AdwMessageDialog $self,
  Str              $body
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_body_use_markup (
  AdwMessageDialog $self,
  gboolean         $use_markup
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_close_response (
  AdwMessageDialog $self,
  Str              $response
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_default_response (
  AdwMessageDialog $self,
  Str              $response
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_extra_child (
  AdwMessageDialog $self,
  GtkWidget        $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_heading (
  AdwMessageDialog $self,
  Str              $heading
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_heading_use_markup (
  AdwMessageDialog $self,
  gboolean         $use_markup
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_response_appearance (
  AdwMessageDialog      $self,
  Str                   $response,
  AdwResponseAppearance $appearance
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_response_enabled (
  AdwMessageDialog $self,
  Str              $response,
  gboolean         $enabled
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_set_response_label (
  AdwMessageDialog $self,
  Str              $response,
  Str              $label
)
  is      native(adwaita)
  is      export
{ * }

sub adw_message_dialog_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
