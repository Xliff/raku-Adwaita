

### /usr/src/libadwaita-1-1.3~alpha/src/adw-swipeable.h

sub adw_swipeable_get_cancel_progress (AdwSwipeable $self) 
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_swipeable_get_distance (AdwSwipeable $self) 
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_swipeable_get_progress (AdwSwipeable $self) 
  returns gdouble
  is      native(adwaita)
  is      export
{ * }

sub adw_swipeable_get_snap_points (
  AdwSwipeable $self,
  gint         $n_snap_points is rw
) 
  returns double
  is      native(adwaita)
  is      export
{ * }

sub adw_swipeable_get_swipe_area (
  AdwSwipeable           $self,
  AdwNavigationDirection $navigation_direction,
  gboolean               $is_drag,
  GdkRectangle           $rect
) 
  is      native(adwaita)
  is      export
{ * }

