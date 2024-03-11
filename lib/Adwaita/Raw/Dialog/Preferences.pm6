use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Dialog::Preferences;

### /usr/src/libadwaita/src/adw-preferences-dialog.h

sub adw_preferences_dialog_add (
  AdwPreferencesDialog $self,
  AdwPreferencesPage   $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_add_toast (
  AdwPreferencesDialog $self,
  AdwToast             $toast
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_get_search_enabled (AdwPreferencesDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_get_visible_page (AdwPreferencesDialog $self)
  returns AdwPreferencesPage
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_get_visible_page_name (AdwPreferencesDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_new
  returns AdwPreferencesDialog
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_pop_subpage (AdwPreferencesDialog $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_push_subpage (
  AdwPreferencesDialog $self,
  AdwNavigationPage    $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_remove (
  AdwPreferencesDialog $self,
  AdwPreferencesPage   $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_set_search_enabled (
  AdwPreferencesDialog $self,
  gboolean             $search_enabled
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_set_visible_page (
  AdwPreferencesDialog $self,
  AdwPreferencesPage   $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_dialog_set_visible_page_name (
  AdwPreferencesDialog $self,
  Str                  $name
)
  is      native(adwaita)
  is      export
{ * }
