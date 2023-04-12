use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::SwipeTracker;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-swipe-tracker.h

sub adw_swipe_tracker_get_allow_long_swipes (AdwSwipeTracker $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_get_allow_mouse_drag (AdwSwipeTracker $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_get_enabled (AdwSwipeTracker $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_get_reversed (AdwSwipeTracker $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_get_swipeable (AdwSwipeTracker $self)
  returns AdwSwipeable
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_new (AdwSwipeable $swipeable)
  returns AdwSwipeTracker
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_set_allow_long_swipes (
  AdwSwipeTracker $self,
  gboolean        $allow_long_swipes
)
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_set_allow_mouse_drag (
  AdwSwipeTracker $self,
  gboolean        $allow_mouse_drag
)
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_set_enabled (
  AdwSwipeTracker $self,
  gboolean        $enabled
)
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_set_reversed (
  AdwSwipeTracker $self,
  gboolean        $reversed
)
  is      native(adwaita)
  is      export
{ * }

sub adw_swipe_tracker_shift_position (
  AdwSwipeTracker $self,
  gdouble         $delta
)
  is      native(adwaita)
  is      export
{ * }
