use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Animation::Target;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-animation-target.h

sub adw_callback_animation_target_new (
           &callback (gdouble, gpointer),
  gpointer $user_data,
           &destroy (gpointer)
)
  returns AdwAnimationTarget
  is      native(adwaita)
  is      export
{ * }

sub adw_property_animation_target_get_object (AdwPropertyAnimationTarget $self)
  returns GObject
  is      native(adwaita)
  is      export
{ * }

sub adw_property_animation_target_get_pspec (AdwPropertyAnimationTarget $self)
  returns GParamSpec
  is      native(adwaita)
  is      export
{ * }

sub adw_property_animation_target_new (
  GObject $object,
  Str     $property_name
)
  returns AdwAnimationTarget
  is      native(adwaita)
  is      export
{ * }

sub adw_property_animation_target_new_for_pspec (
  GObject    $object,
  GParamSpec $pspec
)
  returns AdwAnimationTarget
  is      native(adwaita)
  is      export
{ * }

sub adw_animation_target_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
