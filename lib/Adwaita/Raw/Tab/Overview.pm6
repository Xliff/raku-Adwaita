use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GDK::Raw::Enums:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Tab::Overview;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-tab-overview.h

sub adw_tab_overview_get_child (AdwTabOverview $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_enable_new_tab (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_enable_search (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_extra_drag_preload (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_inverted (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_open (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_search_active (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_secondary_menu (AdwTabOverview $self)
  returns GMenuModel
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_show_end_title_buttons (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_show_start_title_buttons (AdwTabOverview $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_get_view (AdwTabOverview $self)
  returns AdwTabView
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_new
  returns AdwTabOverview
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_child (
  AdwTabOverview $self,
  GtkWidget      $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_enable_new_tab (
  AdwTabOverview $self,
  gboolean       $enable_new_tab
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_enable_search (
  AdwTabOverview $self,
  gboolean       $enable_search
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_extra_drag_preload (
  AdwTabOverview $self,
  gboolean       $preload
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_inverted (
  AdwTabOverview $self,
  gboolean       $inverted
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_open (
  AdwTabOverview $self,
  gboolean       $open
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_secondary_menu (
  AdwTabOverview $self,
  GMenuModel     $secondary_menu
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_show_end_title_buttons (
  AdwTabOverview $self,
  gboolean       $show_end_title_buttons
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_show_start_title_buttons (
  AdwTabOverview $self,
  gboolean       $show_start_title_buttons
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_set_view (
  AdwTabOverview $self,
  AdwTabView     $view
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_overview_setup_extra_drop_target (
  AdwTabOverview $self,
  GdkDragAction  $actions,
  GType          $types,
  gsize          $n_types
)
  is      native(adwaita)
  is      export
{ * }
