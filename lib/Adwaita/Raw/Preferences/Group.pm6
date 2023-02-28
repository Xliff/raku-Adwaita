use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Preferences::Group;

### /usr/src/libadwaita-1-1.2.0/src/adw-preferences-group.h

sub adw_preferences_group_add (
  AdwPreferencesGroup $self,
  GtkWidget           $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_get_description (AdwPreferencesGroup $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_get_header_suffix (AdwPreferencesGroup $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_get_title (AdwPreferencesGroup $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_new
  returns AdwPreferencesGroup
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_remove (
  AdwPreferencesGroup $self,
  GtkWidget           $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_set_description (
  AdwPreferencesGroup $self,
  Str                 $description
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_set_header_suffix (
  AdwPreferencesGroup $self,
  GtkWidget           $suffix
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_group_set_title (
  AdwPreferencesGroup $self,
  Str                 $title
)
  is      native(adwaita)
  is      export
{ * }
