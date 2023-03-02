use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GDK::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Style::Manager;

### /usr/src/libadwaita-1-1.2.0/src/adw-style-manager.h

sub adw_style_manager_get_color_scheme (AdwStyleManager $self)
  returns AdwColorScheme
  is      native(adwaita)
  is      export
{ * }

sub adw_style_manager_get_dark (AdwStyleManager $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_style_manager_get_default
  returns AdwStyleManager
  is      native(adwaita)
  is      export
{ * }

sub adw_style_manager_get_display (AdwStyleManager $self)
  returns GdkDisplay
  is      native(adwaita)
  is      export
{ * }

sub adw_style_manager_get_for_display (GdkDisplay $display)
  returns AdwStyleManager
  is      native(adwaita)
  is      export
{ * }

sub adw_style_manager_get_high_contrast (AdwStyleManager $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_style_manager_get_system_supports_color_schemes (
  AdwStyleManager $self
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_style_manager_set_color_scheme (
  AdwStyleManager $self,
  AdwColorScheme  $color_scheme
)
  is      native(adwaita)
  is      export
{ * }
