use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Preferences::Page;

### /usr/src/libadwaita-1-1.2.0/src/adw-preferences-page.h

sub adw_preferences_page_add (
  AdwPreferencesPage  $self,
  AdwPreferencesGroup $group
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_get_icon_name (AdwPreferencesPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_get_name (AdwPreferencesPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_get_title (AdwPreferencesPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_get_use_underline (AdwPreferencesPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_remove (
  AdwPreferencesPage  $self,
  AdwPreferencesGroup $group
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_set_icon_name (
  AdwPreferencesPage $self,
  Str                $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_set_name (
  AdwPreferencesPage $self,
  Str                $name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_set_title (
  AdwPreferencesPage $self,
  Str                $title
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_page_set_use_underline (
  AdwPreferencesPage $self,
  gboolean           $use_underline
)
  is      native(adwaita)
  is      export
{ * }
