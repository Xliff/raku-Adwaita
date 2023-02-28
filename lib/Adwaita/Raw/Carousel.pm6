use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Carousel;

### /usr/src/libadwaita-1-1.2.0/src/adw-carousel.h

sub adw_carousel_append (AdwCarousel $self, GtkWidget $child)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_allow_long_swipes (AdwCarousel $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_allow_mouse_drag (AdwCarousel $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_allow_scroll_wheel (AdwCarousel $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_interactive (AdwCarousel $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_n_pages (AdwCarousel $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_nth_page (
  AdwCarousel $self,
  guint       $n
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_position (AdwCarousel $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_reveal_duration (AdwCarousel $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_scroll_params (AdwCarousel $self)
  returns AdwSpringParams
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_get_spacing (AdwCarousel $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_insert (AdwCarousel $self, GtkWidget $child, gint $position)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_new
  returns AdwCarousel
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_prepend (AdwCarousel $self, GtkWidget $child)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_remove (AdwCarousel $self, GtkWidget $child)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_reorder (
  AdwCarousel $self,
  GtkWidget   $child,
  gint        $position
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_scroll_to (
  AdwCarousel $self,
  GtkWidget   $widget,
  gboolean    $animate
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_set_allow_long_swipes (
  AdwCarousel $self,
  gboolean    $allow_long_swipes
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_set_allow_mouse_drag (
  AdwCarousel $self,
  gboolean    $allow_mouse_drag
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_set_allow_scroll_wheel (
  AdwCarousel $self,
  gboolean    $allow_scroll_wheel
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_set_interactive (
  AdwCarousel $self,
  gboolean    $interactive
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_set_reveal_duration (
  AdwCarousel $self,
  guint       $reveal_duration
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_set_scroll_params (
  AdwCarousel     $self,
  AdwSpringParams $params
)
  is      native(adwaita)
  is      export
{ * }

sub adw_carousel_set_spacing (
  AdwCarousel $self,
  guint       $spacing
)
  is      native(adwaita)
  is      export
{ * }
