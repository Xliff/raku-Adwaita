use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GDK::Raw::Enums;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Tab::Bar;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-tab-bar.h

sub adw_tab_bar_get_autohide (AdwTabBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_end_action_widget (AdwTabBar $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_expand_tabs (AdwTabBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_extra_drag_preload (AdwTabBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_inverted (AdwTabBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_is_overflowing (AdwTabBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_start_action_widget (AdwTabBar $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_tabs_revealed (AdwTabBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_view (AdwTabBar $self)
  returns AdwTabView
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_new
  returns AdwTabBar
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_set_autohide (
  AdwTabBar $self,
  gboolean  $autohide
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_set_end_action_widget (
  AdwTabBar $self,
  GtkWidget $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_set_expand_tabs (
  AdwTabBar $self,
  gboolean  $expand_tabs
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_set_extra_drag_preload (
  AdwTabBar $self,
  gboolean  $preload
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_set_inverted (
  AdwTabBar $self,
  gboolean  $inverted
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_set_start_action_widget (
  AdwTabBar $self,
  GtkWidget $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_set_view (
  AdwTabBar  $self,
  AdwTabView $view
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_setup_extra_drop_target (
  AdwTabBar     $self,
  GdkDragAction $actions,
  GType         $types,
  gsize         $n_types
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_bar_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
