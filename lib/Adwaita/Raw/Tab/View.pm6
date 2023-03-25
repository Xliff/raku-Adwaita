use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Tab::View;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-tab-view.h

sub adw_tab_view_add_page (
  AdwTabView $self,
  GtkWidget  $child,
  AdwTabPage $parent
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_add_shortcuts (
  AdwTabView          $self,
  AdwTabViewShortcuts $shortcuts
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_append (
  AdwTabView $self,
  GtkWidget  $child
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_append_pinned (
  AdwTabView $self,
  GtkWidget  $child
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_close_other_pages (
  AdwTabView $self,
  AdwTabPage $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_close_page (
  AdwTabView $self,
  AdwTabPage $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_close_page_finish (
  AdwTabView $self,
  AdwTabPage $page,
  gboolean   $confirm
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_close_pages_after (
  AdwTabView $self,
  AdwTabPage $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_close_pages_before (
  AdwTabView $self,
  AdwTabPage $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_default_icon (AdwTabView $self)
  returns GIcon
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_is_transferring_page (AdwTabView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_menu_model (AdwTabView $self)
  returns GMenuModel
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_n_pages (AdwTabView $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_n_pinned_pages (AdwTabView $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_nth_page (
  AdwTabView $self,
  gint       $position
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_page (
  AdwTabView $self,
  GtkWidget  $child
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_page_position (
  AdwTabView $self,
  AdwTabPage $page
)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_pages (AdwTabView $self)
  returns GtkSelectionModel
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_selected_page (AdwTabView $self)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_get_shortcuts (AdwTabView $self)
  returns AdwTabViewShortcuts
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_insert (
  AdwTabView $self,
  GtkWidget  $child,
  gint       $position
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_insert_pinned (
  AdwTabView $self,
  GtkWidget  $child,
  gint       $position
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_invalidate_thumbnails (AdwTabView $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_new
  returns AdwTabView
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_prepend (
  AdwTabView $self,
  GtkWidget  $child
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_prepend_pinned (
  AdwTabView $self,
  GtkWidget  $child
)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_remove_shortcuts (
  AdwTabView          $self,
  AdwTabViewShortcuts $shortcuts
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_reorder_backward (
  AdwTabView $self,
  AdwTabPage $page
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_reorder_first (
  AdwTabView $self,
  AdwTabPage $page
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_reorder_forward (
  AdwTabView $self,
  AdwTabPage $page
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_reorder_last (
  AdwTabView $self,
  AdwTabPage $page
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_reorder_page (
  AdwTabView $self,
  AdwTabPage $page,
  gint       $position
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_select_next_page (AdwTabView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_select_previous_page (AdwTabView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_set_default_icon (
  AdwTabView $self,
  GIcon      $default_icon
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_set_menu_model (
  AdwTabView $self,
  GMenuModel $menu_model
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_set_page_pinned (
  AdwTabView $self,
  AdwTabPage $page,
  gboolean   $pinned
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_set_selected_page (
  AdwTabView $self,
  AdwTabPage $selected_page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_set_shortcuts (
  AdwTabView          $self,
  AdwTabViewShortcuts $shortcuts
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_view_transfer_page (
  AdwTabView $self,
  AdwTabPage $page,
  AdwTabView $other_view,
  gint       $position
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_child (AdwTabPage $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_icon (AdwTabPage $self)
  returns GIcon
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_indicator_activatable (AdwTabPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_indicator_icon (AdwTabPage $self)
  returns GIcon
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_indicator_tooltip (AdwTabPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_keyword (AdwTabPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_live_thumbnail (AdwTabPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_loading (AdwTabPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_needs_attention (AdwTabPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_parent (AdwTabPage $self)
  returns AdwTabPage
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_pinned (AdwTabPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_selected (AdwTabPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_thumbnail_xalign (AdwTabPage $self)
  returns gfloat
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_thumbnail_yalign (AdwTabPage $self)
  returns gfloat
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_title (AdwTabPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_get_tooltip (AdwTabPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_invalidate_thumbnail (AdwTabPage $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_icon (
  AdwTabPage $self,
  GIcon      $icon
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_indicator_activatable (
  AdwTabPage $self,
  gboolean   $activatable
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_indicator_icon (
  AdwTabPage $self,
  GIcon      $indicator_icon
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_indicator_tooltip (
  AdwTabPage $self,
  Str        $tooltip
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_keyword (
  AdwTabPage $self,
  Str        $keyword
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_live_thumbnail (
  AdwTabPage $self,
  gboolean   $live_thumbnail
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_loading (
  AdwTabPage $self,
  gboolean   $loading
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_needs_attention (
  AdwTabPage $self,
  gboolean   $needs_attention
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_thumbnail_xalign (
  AdwTabPage $self,
  gfloat     $xalign
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_thumbnail_yalign (
  AdwTabPage $self,
  gfloat     $yalign
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_title (
  AdwTabPage $self,
  Str        $title
)
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_page_set_tooltip (
  AdwTabPage $self,
  Str        $tooltip
)
  is      native(adwaita)
  is      export
{ * }
