use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Structs;
use GTK::Raw::Enums;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Button::Split;

### /usr/src/libadwaita-1-1.2.0/src/adw-split-button.h

sub adw_split_button_get_child (AdwSplitButton $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_get_direction (AdwSplitButton $self)
  returns GtkArrowType
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_get_dropdown_tooltip (AdwSplitButton $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_get_icon_name (AdwSplitButton $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_get_label (AdwSplitButton $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_get_menu_model (AdwSplitButton $self)
  returns GMenuModel
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_get_popover (AdwSplitButton $self)
  returns GtkPopover
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_get_use_underline (AdwSplitButton $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_new
  returns AdwSplitButton
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_popdown (AdwSplitButton $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_popup (AdwSplitButton $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_child (
  AdwSplitButton $self,
  GtkWidget      $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_direction (
  AdwSplitButton $self,
  GtkArrowType   $direction
)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_dropdown_tooltip (
  AdwSplitButton $self,
  Str            $tooltip
)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_icon_name (
  AdwSplitButton $self,
  Str            $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_label (
  AdwSplitButton $self,
  Str            $label
)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_menu_model (
  AdwSplitButton $self,
  GMenuModel     $menu_model
)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_popover (
  AdwSplitButton $self,
  GtkPopover     $popover
)
  is      native(adwaita)
  is      export
{ * }

sub adw_split_button_set_use_underline (
  AdwSplitButton $self,
  gboolean       $use_underline
)
  is      native(adwaita)
  is      export
{ * }
