use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::View::Switcher::Title;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-view-switcher-title.h

sub adw_view_switcher_title_get_stack (AdwViewSwitcherTitle $self)
  returns AdwViewStack
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_get_subtitle (AdwViewSwitcherTitle $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_get_title (AdwViewSwitcherTitle $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_get_title_visible (AdwViewSwitcherTitle $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_get_view_switcher_enabled (AdwViewSwitcherTitle $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_new
  returns AdwViewSwitcherTitle
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_set_stack (
  AdwViewSwitcherTitle $self,
  AdwViewStack         $stack
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_set_subtitle (
  AdwViewSwitcherTitle $self,
  Str                  $subtitle
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_set_title (
  AdwViewSwitcherTitle $self,
  Str                  $title
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_title_set_view_switcher_enabled (
  AdwViewSwitcherTitle $self,
  gboolean             $enabled
)
  is      native(adwaita)
  is      export
{ * }
