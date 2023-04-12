use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::SwipeTracker;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use Adwaita::Roles::Swipeable;

our subset AdwSwipeTrackerAncestry is export of Mu
  where AdwSwipeTracker | GObject;

class Adwaita::SwipeTracker {
  also does GLib::Roles::Object;

  has AdwSwipeTracker $!adw-st is implementor;

  submethod BUILD ( :$adw-swipe-tracker ) {
    self.setAdwSwipeTracker($adw-swipe-tracker) if $adw-swipe-tracker
  }

  method setAdwSwipeTracker (AdwSwipeTrackerAncestry $_) {
    my $to-parent;

    $!adw-st = do {
      when AdwSwipeTracker {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSwipeTracker, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSwipeTracker
    is also<AdwSwipeTracker>
  { $!adw-st }

  multi method new (
    $adw-swipe-tracker where * ~~ AdwSwipeTrackerAncestry,

    :$ref = True
  ) {
    return unless $adw-swipe-tracker;

    my $o = self.bless( :$adw-swipe-tracker );
    $o.ref if $ref;
    $o;
  }
  multi method new (AdwSwipeable() $swipeable) {
    my $adw-swipe-tracker = adw_swipe_tracker_new($swipeable);

    $adw-swipe-tracker ?? self.bless( :$adw-swipe-tracker ) !! Nil;
  }

  # Type: boolean
  method allow-long-swipes is rw  is g-property is also<allow_long_swipes> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-long-swipes', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-long-swipes', $gv);
      }
    );
  }

  # Type: boolean
  method allow-mouse-drag is rw  is g-property is also<allow_mouse_drag> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-mouse-drag', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-mouse-drag', $gv);
      }
    );
  }

  # Type: boolean
  method enabled is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enabled', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enabled', $gv);
      }
    );
  }

  # Type: boolean
  method reversed is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reversed', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('reversed', $gv);
      }
    );
  }

  # Type: AdwSwipeable
  method swipeable ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Adwaita::Swipeable.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('swipeable', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Swipeable.getTypePair
        );
      },
      STORE => -> $, AdwSwipeable() $val is copy {
        $gv.object = $val;
        self.prop_set('swipeable', $gv);
      }
    );
  }

  method Begin-Swipe {
    self.connect($!adw-st, 'begin-swipe')
  }

  method  End-Swipe {
    self.connect($!adw-st, 'end-swipe');
  }

  method Prepare {
    self.connect-int($!adw-st, 'prepare');
  }

  method Update-Swipe {
    self.connect-num($!adw-st, 'update-swipe');
  }

  method get_allow_long_swipes is also<get-allow-long-swipes> {
    so adw_swipe_tracker_get_allow_long_swipes($!adw-st);
  }

  method get_allow_mouse_drag is also<get-allow-mouse-drag> {
    so adw_swipe_tracker_get_allow_mouse_drag($!adw-st);
  }

  method get_enabled is also<get-enabled> {
    so adw_swipe_tracker_get_enabled($!adw-st);
  }

  method get_reversed is also<get-reversed> {
    so adw_swipe_tracker_get_reversed($!adw-st);
  }

  method get_swipeable ( :$raw = False ) is also<get-swipeable> {
    propReturnObject(
      adw_swipe_tracker_get_swipeable($!adw-st),
      $raw,
      |Adwaita::Swipeable.getTypePair
    );
  }

  method set_allow_long_swipes (Int() $allow_long_swipes)
    is also<set-allow-long-swipes>
  {
    my gboolean $a = $allow_long_swipes.so.Int;

    adw_swipe_tracker_set_allow_long_swipes($!adw-st, $a);
  }

  method set_allow_mouse_drag (Int() $allow_mouse_drag)
    is also<set-allow-mouse-drag>
  {
    my gboolean $a = $allow_mouse_drag.so.Int;

    adw_swipe_tracker_set_allow_mouse_drag($!adw-st, $a);
  }

  method set_enabled (Int() $enabled) is also<set-enabled> {
    my gboolean $e = $enabled.so.Int;

    adw_swipe_tracker_set_enabled($!adw-st, $e);
  }

  method set_reversed (Int() $reversed) is also<set-reversed> {
    my gboolean $r = $reversed.so.Int;

    adw_swipe_tracker_set_reversed($!adw-st, $r);
  }

  method shift_position (Num() $delta) is also<shift-position> {
    my gdouble $d = $delta;

    adw_swipe_tracker_shift_position($!adw-st, $d);
  }

}
