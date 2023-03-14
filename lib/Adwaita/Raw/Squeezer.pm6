use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use GTK::Raw::Structs;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Squeezer;

### /usr/src/libadwaita-1-1.2.0/src/adw-squeezer.h

sub adw_squeezer_add (
  AdwSqueezer $self,
  GtkWidget   $child
)
  returns AdwSqueezerPage
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_allow_none (AdwSqueezer $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_homogeneous (AdwSqueezer $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_interpolate_size (AdwSqueezer $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_page (
  AdwSqueezer $self,
  GtkWidget   $child
)
  returns AdwSqueezerPage
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_pages (AdwSqueezer $self)
  returns GtkSelectionModel
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_switch_threshold_policy (AdwSqueezer $self)
  returns AdwFoldThresholdPolicy
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_transition_duration (AdwSqueezer $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_transition_running (AdwSqueezer $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_transition_type (AdwSqueezer $self)
  returns AdwSqueezerTransitionType
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_visible_child (AdwSqueezer $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_xalign (AdwSqueezer $self)
  returns gfloat
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_yalign (AdwSqueezer $self)
  returns gfloat
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_new
  returns AdwSqueezer
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_page_get_child (AdwSqueezerPage $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_page_get_enabled (AdwSqueezerPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_page_set_enabled (
  AdwSqueezerPage $self,
  gboolean        $enabled
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_remove (
  AdwSqueezer $self,
  GtkWidget   $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_allow_none (
  AdwSqueezer $self,
  gboolean    $allow_none
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_homogeneous (
  AdwSqueezer $self,
  gboolean    $homogeneous
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_interpolate_size (
  AdwSqueezer $self,
  gboolean    $interpolate_size
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_switch_threshold_policy (
  AdwSqueezer            $self,
  AdwFoldThresholdPolicy $policy
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_transition_duration (
  AdwSqueezer $self,
  guint       $duration
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_transition_type (
  AdwSqueezer               $self,
  AdwSqueezerTransitionType $transition
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_xalign (
  AdwSqueezer $self,
  gfloat      $xalign
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_set_yalign (
  AdwSqueezer $self,
  gfloat      $yalign
)
  is      native(adwaita)
  is      export
{ * }

sub adw_squeezer_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
