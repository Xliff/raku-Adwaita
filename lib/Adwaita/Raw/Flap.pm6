use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Enums:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Flap;

### /usr/src/libadwaita-1-1.2.0/src/adw-flap.h

sub adw_flap_get_content (AdwFlap $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_flap (AdwFlap $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_flap_position (AdwFlap $self)
  returns GtkPackType
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_fold_duration (AdwFlap $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_fold_policy (AdwFlap $self)
  returns AdwFlapFoldPolicy
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_fold_threshold_policy (AdwFlap $self)
  returns AdwFoldThresholdPolicy
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_folded (AdwFlap $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_locked (AdwFlap $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_modal (AdwFlap $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_reveal_flap (AdwFlap $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_reveal_params (AdwFlap $self)
  returns AdwSpringParams
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_reveal_progress (AdwFlap $self)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_separator (AdwFlap $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_swipe_to_close (AdwFlap $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_swipe_to_open (AdwFlap $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_transition_type (AdwFlap $self)
  returns AdwFlapTransitionType
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_new
  returns AdwFlap
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_content (
  AdwFlap   $self,
  GtkWidget $content
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_flap (
  AdwFlap   $self,
  GtkWidget $flap
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_flap_position (
  AdwFlap     $self,
  GtkPackType $position
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_fold_duration (
  AdwFlap $self,
  guint   $duration
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_fold_policy (
  AdwFlap           $self,
  AdwFlapFoldPolicy $policy
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_fold_threshold_policy (
  AdwFlap                $self,
  AdwFoldThresholdPolicy $policy
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_locked (
  AdwFlap  $self,
  gboolean $locked
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_modal (
  AdwFlap  $self,
  gboolean $modal
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_reveal_flap (
  AdwFlap  $self,
  gboolean $reveal_flap
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_reveal_params (
  AdwFlap         $self,
  AdwSpringParams $params
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_separator (
  AdwFlap   $self,
  GtkWidget $separator
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_swipe_to_close (
  AdwFlap  $self,
  gboolean $swipe_to_close
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_swipe_to_open (
  AdwFlap  $self,
  gboolean $swipe_to_open
)
  is      native(adwaita)
  is      export
{ * }

sub adw_flap_set_transition_type (
  AdwFlap               $self,
  AdwFlapTransitionType $transition_type
)
  is      native(adwaita)
  is      export
{ * }
