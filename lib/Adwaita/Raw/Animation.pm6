use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Animation;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-animation.h

sub adw_animation_get_state (AdwAnimation $self)
  returns AdwAnimationState
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_get_target (AdwAnimation $self)
  returns AdwAnimationTarget
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_get_value (AdwAnimation $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_get_widget (AdwAnimation $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_pause (AdwAnimation $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_play (AdwAnimation $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_reset (AdwAnimation $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_resume (AdwAnimation $self)
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_set_target (
  AdwAnimation       $self,
  AdwAnimationTarget $target
)
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_skip (AdwAnimation $self)
  is      native(adwaita)
  is      export
{ * }
