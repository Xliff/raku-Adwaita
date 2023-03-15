use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Animation::Timed;

### /usr/src/libadwaita-1-1.3~alpha/src/./adw-timed-animation.h

sub adw_timed_animation_get_alternate (AdwTimedAnimation $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_get_duration (AdwTimedAnimation $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_get_easing (AdwTimedAnimation $self)
  returns AdwEasing
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_get_repeat_count (AdwTimedAnimation $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_get_reverse (AdwTimedAnimation $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_get_value_from (AdwTimedAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_get_value_to (AdwTimedAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_new (
  GtkWidget          $widget,
  gdouble            $from,
  gdouble            $to,
  guint              $duration,
  AdwAnimationTarget $target
)
  returns AdwAnimation
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_set_alternate (
  AdwTimedAnimation $self,
  gboolean          $alternate
)
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_set_duration (
  AdwTimedAnimation $self,
  guint             $duration
)
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_set_easing (
  AdwTimedAnimation $self,
  AdwEasing         $easing
)
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_set_repeat_count (
  AdwTimedAnimation $self,
  guint             $repeat_count
)
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_set_reverse (
  AdwTimedAnimation $self,
  gboolean          $reverse
)
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_set_value_from (
  AdwTimedAnimation $self,
  gdouble           $value
)
  is      native(adwaita)
  is      export
{ * }

sub adw_timed_animation_set_value_to (
  AdwTimedAnimation $self,
  gdouble           $value
)
  is      native(adwaita)
  is      export
{ * }
