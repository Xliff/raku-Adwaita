use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Navigation::View;

### /usr/src/libadwaita/src/adw-navigation-split-view.h

sub adw_navigation_split_view_get_collapsed (AdwNavigationSplitView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_get_content (AdwNavigationSplitView $self)
  returns AdwNavigationPage
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_get_max_sidebar_width (
  AdwNavigationSplitView $self
)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_get_min_sidebar_width (
  AdwNavigationSplitView $self
)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_get_show_content (AdwNavigationSplitView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_get_sidebar (AdwNavigationSplitView $self)
  returns AdwNavigationPage
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_get_sidebar_width_fraction (
  AdwNavigationSplitView $self
)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_get_sidebar_width_unit (
  AdwNavigationSplitView $self
)
  returns AdwLengthUnit
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_collapsed (
  AdwNavigationSplitView $self,
  gboolean               $collapsed
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_content (
  AdwNavigationSplitView $self,
  AdwNavigationPage      $content
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_max_sidebar_width (
  AdwNavigationSplitView $self,
  gdouble                $width
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_min_sidebar_width (
  AdwNavigationSplitView $self,
  gdouble                $width
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_show_content (
  AdwNavigationSplitView $self,
  gboolean               $show_content
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_sidebar (
  AdwNavigationSplitView $self,
  AdwNavigationPage      $sidebar
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_sidebar_width_fraction (
  AdwNavigationSplitView $self,
  gdouble                $fraction
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_split_view_set_sidebar_width_unit (
  AdwNavigationSplitView $self,
  AdwLengthUnit          $unit
)
  is      native(adwaita)
  is      export
{ * }
