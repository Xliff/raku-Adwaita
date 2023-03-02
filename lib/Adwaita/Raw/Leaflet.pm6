use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Leaflet;

### /usr/src/libadwaita-1-1.2.0/src/adw-leaflet.h

sub adw_leaflet_append (
  AdwLeaflet $self,
  GtkWidget  $child
)
  returns AdwLeafletPage
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_adjacent_child (
  AdwLeaflet             $self,
  AdwNavigationDirection $direction
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_can_navigate_back (AdwLeaflet $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_can_navigate_forward (AdwLeaflet $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_can_unfold (AdwLeaflet $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_child_by_name (
  AdwLeaflet $self,
  Str        $name
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_child_transition_params (AdwLeaflet $self)
  returns AdwSpringParams
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_child_transition_running (AdwLeaflet $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_fold_threshold_policy (AdwLeaflet $self)
  returns AdwFoldThresholdPolicy
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_folded (AdwLeaflet $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_homogeneous (AdwLeaflet $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_mode_transition_duration (AdwLeaflet $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_page (
  AdwLeaflet $self,
  GtkWidget  $child
)
  returns AdwLeafletPage
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_pages (AdwLeaflet $self)
  returns GtkSelectionModel
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_transition_type (AdwLeaflet $self)
  returns AdwLeafletTransitionType
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_visible_child (AdwLeaflet $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_get_visible_child_name (AdwLeaflet $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_insert_child_after (
  AdwLeaflet $self,
  GtkWidget  $child,
  GtkWidget  $sibling
)
  returns AdwLeafletPage
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_navigate (
  AdwLeaflet             $self,
  AdwNavigationDirection $direction
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_page_get_child (AdwLeafletPage $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_page_get_name (AdwLeafletPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_page_get_navigatable (AdwLeafletPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_page_set_name (
  AdwLeafletPage $self,
  Str            $name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_page_set_navigatable (
  AdwLeafletPage $self,
  gboolean       $navigatable
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_prepend (
  AdwLeaflet $self,
  GtkWidget  $child
)
  returns AdwLeafletPage
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_remove (
  AdwLeaflet $self,
  GtkWidget  $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_reorder_child_after (
  AdwLeaflet $self,
  GtkWidget  $child,
  GtkWidget  $sibling
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_can_navigate_back (
  AdwLeaflet $self,
  gboolean   $can_navigate_back
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_can_navigate_forward (
  AdwLeaflet $self,
  gboolean   $can_navigate_forward
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_can_unfold (
  AdwLeaflet $self,
  gboolean   $can_unfold
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_child_transition_params (
  AdwLeaflet      $self,
  AdwSpringParams $params
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_fold_threshold_policy (
  AdwLeaflet             $self,
  AdwFoldThresholdPolicy $policy
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_homogeneous (
  AdwLeaflet $self,
  gboolean   $homogeneous
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_mode_transition_duration (
  AdwLeaflet $self,
  guint      $duration
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_transition_type (
  AdwLeaflet               $self,
  AdwLeafletTransitionType $transition
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_visible_child (
  AdwLeaflet $self,
  GtkWidget  $visible_child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_leaflet_set_visible_child_name (
  AdwLeaflet $self,
  Str        $name
)
  is      native(adwaita)
  is      export
{ * }
