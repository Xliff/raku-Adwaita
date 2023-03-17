use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Animation::Spring;

### /usr/src/libadwaita-1-1.3~alpha/src/../src/adw-spring-animation.h

sub adw_spring_animation_get_clamp (AdwSpringAnimation $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_get_epsilon (AdwSpringAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_get_estimated_duration (AdwSpringAnimation $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_get_initial_velocity (AdwSpringAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_get_spring_params (AdwSpringAnimation $self)
  returns AdwSpringParams
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_get_value_from (AdwSpringAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_get_value_to (AdwSpringAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_get_velocity (AdwSpringAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_new (
  GtkWidget          $widget,
  gdouble            $from,
  gdouble            $to,
  AdwSpringParams    $spring_params,
  AdwAnimationTarget $target
)
  returns AdwAnimation
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_set_clamp (
  AdwSpringAnimation $self,
  gboolean           $clamp
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_set_epsilon (
  AdwSpringAnimation $self,
  gdouble            $epsilon
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_set_initial_velocity (
  AdwSpringAnimation $self,
  gdouble            $velocity
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_set_spring_params (
  AdwSpringAnimation $self,
  AdwSpringParams    $spring_params
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_set_value_from (
  AdwSpringAnimation $self,
  gdouble            $value
)
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_animation_set_value_to (
  AdwSpringAnimation $self,
  gdouble            $value
)
  is      native(adwaita)
  is      export
{ * }
