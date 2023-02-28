use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::SpringParams;

### /usr/src/libadwaita-1-1.2.0/src/adw-spring-params.h

sub adw_spring_params_get_damping (AdwSpringParams $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_get_damping_ratio (AdwSpringParams $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_get_mass (AdwSpringParams $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_get_stiffness (AdwSpringParams $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_new (
  gdouble $damping_ratio,
  gdouble $mass,
  gdouble $stiffness
)
  returns AdwSpringParams
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_new_full (
  gdouble $damping,
  gdouble $mass,
  gdouble $stiffness
)
  returns AdwSpringParams
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_ref (AdwSpringParams $self)
  returns AdwSpringParams
  is      native(adwaita)
  is      export
{ * }

sub adw_spring_params_unref (AdwSpringParams $self)
  is      native(adwaita)
  is      export
{ * }
