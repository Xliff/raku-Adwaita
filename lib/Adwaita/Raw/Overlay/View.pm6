use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use GTK::Raw::Enums:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Overlay::View;

### /usr/src/libadwaita/src/adw-overlay-split-view.h

sub adw_overlay_split_view_get_collapsed (AdwOverlaySplitView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_content (AdwOverlaySplitView $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_enable_hide_gesture (AdwOverlaySplitView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_enable_show_gesture (AdwOverlaySplitView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_max_sidebar_width (AdwOverlaySplitView $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_min_sidebar_width (AdwOverlaySplitView $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_pin_sidebar (AdwOverlaySplitView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_show_sidebar (AdwOverlaySplitView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_sidebar (AdwOverlaySplitView $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_sidebar_position (AdwOverlaySplitView $self)
  returns GtkPackType
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_sidebar_width_fraction (AdwOverlaySplitView $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_get_sidebar_width_unit (AdwOverlaySplitView $self)
  returns AdwLengthUnit
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_new
  returns AdwOverlaySplitView
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_collapsed (
  AdwOverlaySplitView $self,
  gboolean            $collapsed
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_content (
  AdwOverlaySplitView $self,
  GtkWidget           $content
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_enable_hide_gesture (
  AdwOverlaySplitView $self,
  gboolean            $enable_hide_gesture
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_enable_show_gesture (
  AdwOverlaySplitView $self,
  gboolean            $enable_show_gesture
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_max_sidebar_width (
  AdwOverlaySplitView $self,
  gdouble             $width
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_min_sidebar_width (
  AdwOverlaySplitView $self,
  gdouble             $width
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_pin_sidebar (
  AdwOverlaySplitView $self,
  gboolean            $pin_sidebar
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_show_sidebar (
  AdwOverlaySplitView $self,
  gboolean            $show_sidebar
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_sidebar (
  AdwOverlaySplitView $self,
  GtkWidget           $sidebar
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_sidebar_position (
  AdwOverlaySplitView $self,
  GtkPackType         $position
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_sidebar_width_fraction (
  AdwOverlaySplitView $self,
  gdouble             $fraction
)
  is      native(adwaita)
  is      export
{ * }

sub adw_overlay_split_view_set_sidebar_width_unit (
  AdwOverlaySplitView $self,
  AdwLengthUnit       $unit
)
  is      native(adwaita)
  is      export
{ * }
