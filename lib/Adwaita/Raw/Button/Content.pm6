use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Button::Content;

### /usr/src/libadwaita-1-1.2.0/src/adw-button-content.h

sub adw_button_content_get_icon_name (AdwButtonContent $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_button_content_get_label (AdwButtonContent $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_button_content_get_use_underline (AdwButtonContent $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_button_content_new
  returns AdwButtonContent
  is      native(adwaita)
  is      export
{ * }

sub adw_button_content_set_icon_name (
  AdwButtonContent $self,
  Str              $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_button_content_set_label (
  AdwButtonContent $self,
  Str              $label
)
  is      native(adwaita)
  is      export
{ * }

sub adw_button_content_set_use_underline (
  AdwButtonContent $self,
  gboolean         $use_underline
)
  is      native(adwaita)
  is      export
{ * }
