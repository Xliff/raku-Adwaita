use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Animation::Timed;

use Adwaita::Animation;

our subset AdwTimedAnimationAncestry is export of Mu
  where AdwTimedAnimation | AdwAnimationAncestry;

class Adwaita::Animation::Timed is Adwaita::Animation {
  has AdwTimedAnimation $!adw-ta is implementor;

  submethod BUILD ( :$adw-timed-animation ) {
    self.setAdwTimedAnimation($adw-timed-animation)
      if $adw-timed-animation
  }

  method setAdwTimedAnimation (AdwTimedAnimationAncestry $_) {
    my $to-parent;

    $!adw-ta = do {
      when AdwTimedAnimation {
        $to-parent = cast(AdwAnimation, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwTimedAnimation, $_);
      }
    }
    self.setAdwAnimation($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwTimedAnimation
    is also<AdwTimedAnimation>
  { $!adw-ta }

  multi method new (
    $adw-timed-animation where * ~~ AdwTimedAnimationAncestry,

    :$ref = True
  ) {
    return unless $adw-timed-animation;

    my $o = self.bless( :$adw-timed-animation );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    GtkWidget()          $widget,
    Num()                $from,
    Num()                $to,
    Int()                $duration,
    AdwAnimationTarget() $target
  ) {
    my gdouble ($f, $t) = ($from, $to);
    my guint    $d      =  $duration;

    my $adw-timed-animation = adw_timed_animation_new(
      $widget,
      $f,
      $t,
      $d,
      $target
    );

    my $o = $adw-timed-animation ?? self.bless( :$adw-timed-animation )
                                 !! Nil;
  }
  multi method new ( %a ) {
    my $adw-timed-animation = ::?CLASS.new-object-ptr( self.get_type );

    my $o = $adw-timed-animation ?? self.bless( :$adw-timed-animation )
                                 !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method alternate is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('alternate', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('alternate', $gv);
      }
    );
  }

  # Type: uint
  method duration is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('duration', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('duration', $gv);
      }
    );
  }

  # Type: AdwEasing
  method easing ( :$enum = True ) is rw  is g-property {
    my $gv = GLib::Value.new-enum( AdwEasing );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('easing', $gv);
        my $e = $gv.enum;
        return $e unless $enum;
        AdwEasingEnum($e);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwEasing) = $val;
        self.prop_set('easing', $gv);
      }
    );
  }

  # Type: uint
  method repeat-count is rw  is g-property is also<repeat_count> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('repeat-count', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('repeat-count', $gv);
      }
    );
  }

  # Type: boolean
  method reverse is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reverse', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('reverse', $gv);
      }
    );
  }

  # Type: double
  method value-from is rw  is g-property is also<value_from> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('value-from', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('value-from', $gv);
      }
    );
  }

  # Type: double
  method value-to is rw  is g-property is also<value_to> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('value-to', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('value-to', $gv);
      }
    );
  }

  method get_alternate is also<get-alternate> {
    so adw_timed_animation_get_alternate($!adw-ta);
  }

  method get_duration is also<get-duration> {
    adw_timed_animation_get_duration($!adw-ta);
  }

  method get_easing ( :$enum = True ) is also<get-easing> {
    my $e = adw_timed_animation_get_easing($!adw-ta);
    return $e unless $enum;
    AdwEasingEnum($e);
  }

  method get_repeat_count is also<get-repeat-count> {
    adw_timed_animation_get_repeat_count($!adw-ta);
  }

  method get_reverse is also<get-reverse> {
    so adw_timed_animation_get_reverse($!adw-ta);
  }

  method get_value_from is also<get-value-from> {
    adw_timed_animation_get_value_from($!adw-ta);
  }

  method get_value_to is also<get-value-to> {
    adw_timed_animation_get_value_to($!adw-ta);
  }

  method set_alternate (Int() $alternate) is also<set-alternate> {
    my gboolean $a = $alternate.so.Int;

    adw_timed_animation_set_alternate($!adw-ta, $a);
  }

  method set_duration (Int() $duration) is also<set-duration> {
    my guint $d = $duration;

    adw_timed_animation_set_duration($!adw-ta, $d);
  }

  method set_easing (Int() $easing) is also<set-easing> {
    my AdwEasing $e = $easing;

    adw_timed_animation_set_easing($!adw-ta, $e);
  }

  method set_repeat_count (Int() $repeat_count) is also<set-repeat-count> {
    my guint $r = $repeat_count;

    adw_timed_animation_set_repeat_count($!adw-ta, $r);
  }

  method set_reverse (Int() $reverse) is also<set-reverse> {
    my gboolean $r = $reverse.so.Int;

    adw_timed_animation_set_reverse($!adw-ta, $r);
  }

  method set_value_from (Num() $value) is also<set-value-from> {
    my gdouble $v = $value;

    adw_timed_animation_set_value_from($!adw-ta, $v);
  }

  method set_value_to (Num() $value) is also<set-value-to> {
    my gdouble $v = $value;

    adw_timed_animation_set_value_to($!adw-ta, $v);
  }

}
