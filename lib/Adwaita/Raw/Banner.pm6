use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Banner;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-banner.h

sub adw_banner_get_button_label (AdwBanner $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_get_revealed (AdwBanner $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_get_title (AdwBanner $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_get_use_markup (AdwBanner $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_new (Str $title)
  returns AdwBanner
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_set_button_label (
  AdwBanner $self,
  Str       $label
)
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_set_revealed (
  AdwBanner $self,
  gboolean  $revealed
)
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_set_title (
  AdwBanner $self,
  Str       $title
)
  is      native(adwaita)
  is      export
{ * }

sub adw_banner_set_use_markup (
  AdwBanner $self,
  gboolean  $use_markup
)
  is      native(adwaita)
  is      export
{ * }
