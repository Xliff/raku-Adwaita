use v6.c;

use Method::Also;

use NativeCall;

use Adwaita::Raw::Types;

role Adwaita::Roles::Swipeable {
  has AdwSwipeable $!adw-s is implementor;

  method roleInit-AdwSwipeable is also<roleInit_AdwSwipeable> {
    return if $!adw-s;

    my \i = findProperImplementor(self);
    $!adw-s = cast( AdwSwipeable, i.get_value(self) );
  }

  method get_cancel_progress is also<get-cancel-progress> {
    adw_swipeable_get_cancel_progress($!adw-s);
  }

  method get_distance is also<get-distance> {
    adw_swipeable_get_distance($!adw-s);
  }

  method get_progress is also<get-progress> {
    adw_swipeable_get_progress($!adw-s);
  }

  proto method get_snap_points (|)
    is also<get-snap-points>
  { * }

  multi method get_snap_points {
    samewith($);
  }
  multi method get_snap_points ($n_snap_points is rw) {
    my gint $n = $n_snap_points;

    adw_swipeable_get_snap_points($!adw-s, $n);
    $n_snap_points = $n;
  }

  method get_swipe_area (
    Int()          $navigation_direction,
    Int()          $is_drag,
    GdkRectangle() $rect
  )
    is also<get-swipe-area>
  {
    my AdwNavigationDirection $n = $navigation_direction;
    my gboolean               $i = $is_drag.so.Int;

    adw_swipeable_get_swipe_area($!adw-s, $n, $i, $rect);
  }

  method adwswipeable-get-type is also<adwswipeable_get_type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_swipeable_get_type, $n, $t );
  }

}


our subset AdwSwipeableAncestry is export of Mu
  where AdwSwipeable | GObject;

class Adwaita::Swipeable {
  has AdwSwipeable $!adw-s is implementor;

  submethod BUILD ( :$adw-swipeable ) {
    self.setAdwSwipeable($adw-swipeable) if $adw-swipeable
  }

  method setAdwSwipeable (AdwSwipeableAncestry $_) {
    my $to-parent;

    $!adw-s = do {
      when AdwSwipeable {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSwipeable, $_);
      }
    }
    self.set($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSwipeable
    is also<AdwSwipeable>
  { $!adw-s }

  multi method new (
    $adw-swipeable where * ~~ AdwSwipeableAncestry,

    :$ref = True
  ) {
    return unless $adw-swipeable;

    my $o = self.bless( :$adw-swipeable );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.adwswipeable-get-type
  }

}


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
  returns gdouble
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

sub adw_swipeable_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
