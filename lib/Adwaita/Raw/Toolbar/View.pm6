use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Toolbar::View;

### /usr/src/libadwaita/src/adw-toolbar-view.h

sub adw_toolbar_view_add_bottom_bar (
  AdwToolbarView $self,
  GtkWidget      $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_add_top_bar (
  AdwToolbarView $self,
  GtkWidget      $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_bottom_bar_height (AdwToolbarView $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_bottom_bar_style (AdwToolbarView $self)
  returns AdwToolbarStyle
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_content (AdwToolbarView $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_extend_content_to_bottom_edge (AdwToolbarView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_extend_content_to_top_edge (AdwToolbarView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_reveal_bottom_bars (AdwToolbarView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_reveal_top_bars (AdwToolbarView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_top_bar_height (AdwToolbarView $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_get_top_bar_style (AdwToolbarView $self)
  returns AdwToolbarStyle
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_new
  returns AdwToolbarView
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_remove (
  AdwToolbarView $self,
  GtkWidget      $widget
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_set_bottom_bar_style (
  AdwToolbarView  $self,
  AdwToolbarStyle $style
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_set_content (
  AdwToolbarView $self,
  GtkWidget      $content
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_set_extend_content_to_bottom_edge (
  AdwToolbarView $self,
  gboolean       $extend
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_set_extend_content_to_top_edge (
  AdwToolbarView $self,
  gboolean       $extend
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_set_reveal_bottom_bars (
  AdwToolbarView $self,
  gboolean       $reveal
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_set_reveal_top_bars (
  AdwToolbarView $self,
  gboolean       $reveal
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toolbar_view_set_top_bar_style (
  AdwToolbarView  $self,
  AdwToolbarStyle $style
)
  is      native(adwaita)
  is      export
{ * }
