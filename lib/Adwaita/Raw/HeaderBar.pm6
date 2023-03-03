use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::HeaderBar;

### /usr/src/libadwaita-1-1.2.0/src/adw-header-bar.h

sub adw_header_bar_get_centering_policy (AdwHeaderBar $self)
  returns AdwCenteringPolicy
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_get_decoration_layout (AdwHeaderBar $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_get_show_end_title_buttons (AdwHeaderBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_get_show_start_title_buttons (AdwHeaderBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_get_title_widget (AdwHeaderBar $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_new
  returns AdwHeaderBar
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_pack_end (
  AdwHeaderBar $self,
  GtkWidget    $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_pack_start (
  AdwHeaderBar $self,
  GtkWidget    $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_remove (
  AdwHeaderBar $self,
  GtkWidget    $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_set_centering_policy (
  AdwHeaderBar       $self,
  AdwCenteringPolicy $centering_policy
)
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_set_decoration_layout (
  AdwHeaderBar $self,
  Str          $layout
)
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_set_show_end_title_buttons (
  AdwHeaderBar $self,
  gboolean     $setting
)
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_set_show_start_title_buttons (
  AdwHeaderBar $self,
  gboolean     $setting
)
  is      native(adwaita)
  is      export
{ * }

sub adw_header_bar_set_title_widget (
  AdwHeaderBar $self,
  GtkWidget    $title_widget
)
  is      native(adwaita)
  is      export
{ * }
