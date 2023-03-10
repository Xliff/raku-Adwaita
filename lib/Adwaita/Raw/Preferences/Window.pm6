use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Preferences::Windows;

### /usr/src/libadwaita-1-1.2.0/src/adw-preferences-window.h

sub adw_preferences_window_add (
  AdwPreferencesWindow $self,
  AdwPreferencesPage   $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_add_toast (
  AdwPreferencesWindow $self,
  AdwToast             $toast
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_close_subpage (AdwPreferencesWindow $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_get_can_navigate_back (AdwPreferencesWindow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_get_search_enabled (AdwPreferencesWindow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_get_visible_page (AdwPreferencesWindow $self)
  returns AdwPreferencesPage
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_get_visible_page_name (AdwPreferencesWindow $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_new
  returns AdwPreferencesWindow
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_present_subpage (
  AdwPreferencesWindow $self,
  GtkWidget            $subpage
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_remove (
  AdwPreferencesWindow $self,
  AdwPreferencesPage   $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_set_can_navigate_back (
  AdwPreferencesWindow $self,
  gboolean             $can_navigate_back
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_set_search_enabled (
  AdwPreferencesWindow $self,
  gboolean             $search_enabled
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_set_visible_page (
  AdwPreferencesWindow $self,
  AdwPreferencesPage   $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_window_set_visible_page_name (
  AdwPreferencesWindow $self,
  Str                  $name
)
  is      native(adwaita)
  is      export
{ * }
