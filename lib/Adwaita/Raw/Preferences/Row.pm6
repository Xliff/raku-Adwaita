use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;

### /usr/src/libadwaita-1-1.2.0/src/adw-preferences-row.h

sub adw_preferences_row_get_title (AdwPreferencesRow $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_get_title_selectable (AdwPreferencesRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_get_use_markup (AdwPreferencesRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_get_use_underline (AdwPreferencesRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_new
  returns AdwPreferencesRow
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_set_title (
  AdwPreferencesRow $self,
  Str               $title
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_set_title_selectable (
  AdwPreferencesRow $self,
  gboolean          $title_selectable
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_set_use_markup (
  AdwPreferencesRow $self,
  gboolean          $use_markup
)
  is      native(adwaita)
  is      export
{ * }

sub adw_preferences_row_set_use_underline (
  AdwPreferencesRow $self,
  gboolean          $use_underline
)
  is      native(adwaita)
  is      export
{ * }
