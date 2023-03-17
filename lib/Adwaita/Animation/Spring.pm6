use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Animation::Spring;

use GLib::Roles::Object;

our subset AdwSpringAnimationAncestry is export of Mu
  where AdwSpringAnimation | GObject;

class Adwaita::Animation::Spring {
  also does GLib::Roles::Object;

  has AdwSpringAnimation $!adw-sa is implementor;

  submethod BUILD ( :$adw-spring-animation ) {
    self.setAdwSpringAnimation($adw-spring-animation)
      if $adw-spring-animation
  }

  method setAdwSpringAnimation (AdwSpringAnimationAncestry $_) {
    my $to-parent;

    $!adw-sa = do {
      when AdwSpringAnimation {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSpringAnimation, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSpringAnimation
    is also<AdwSpringParam>
  { $!adw-sa }

  multi method new (
    $adw-spring-animation where * ~~ AdwSpringAnimationAncestry,

    :$ref = True
  ) {
    return unless $adw-spring-animation;

    my $o = self.bless( :$adw-spring-animation );
    $o.ref if $ref;
    $o;
  }

  multi method new (
    GtkWidget() $widget,
    Num()       $from,
    Num()       $to,
    Int()       $spring_params,
    Int()       $target
  ) {
    my gdouble            ($f, $t) = ($from, $to);
    my AdwSpringParams     $s      =  $spring_params;
    my AdwAnimationTarget  $tg     =  $target;

    my $adw-spring-animation = adw_spring_animation_new(
      $widget,
      $f,
      $t,
      $s,
      $tg
    );

    $adw-spring-animation ?? self.bless( :$adw-spring-animation ) !! Nil;
  }
  multi method new ( *%a ) {
    my $adw-spring-animation = ::?CLASS.new-object-ptr( self.get_type );

    my $o = $adw-spring-animation ?? self.bless( :$adw-spring-animation )
                                  !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method clamp is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('clamp', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('clamp', $gv);
      }
    );
  }

  # Type: double
  method epsilon is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('epsilon', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('epsilon', $gv);
      }
    );
  }

  # Type: uint
  method estimated-duration
    is rw
    is g-property
    is also<estimated_duration>
  {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('estimated-duration', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        warn 'estimated-duration does not allow writing'
      }
    );
  }

  # Type: double
  method initial-velocity is rw  is g-property is also<initial_velocity> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('initial-velocity', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('initial-velocity', $gv);
      }
    );
  }

  # Type: AdwSpringParams
  method spring-params ( :$raw = False)
    is rw
    is g-property
    is also<spring_params>
  {
    my $gv = GLib::Value.new( Adwaita::SpringParams.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('spring-params', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::SpringParams.getTypePair
        );
      },
      STORE => -> $, AdwSpringParams() $val is copy {
        $gv.object = $val;
        self.prop_set('spring-params', $gv);
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

  # Type: double
  method velocity is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('velocity', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        warn 'velocity does not allow writing'
      }
    );
  }


  method get_clamp ( :$raw = False ) is also<get-clamp> {
    so adw_spring_animation_get_clamp($!adw-sa);
  }

  method get_epsilon is also<get-epsilon> {
    adw_spring_animation_get_epsilon($!adw-sa);
  }

  method get_estimated_duration is also<get-estimated-duration> {
    adw_spring_animation_get_estimated_duration($!adw-sa);
  }

  method get_initial_velocity is also<get-initial-velocity> {
    adw_spring_animation_get_initial_velocity($!adw-sa);
  }

  method get_spring_params ( :$raw = False ) is also<get-spring-params> {
    propReturnObject(
      adw_spring_animation_get_spring_params($!adw-sa),
      $raw,
      |Adwaita::SpringParams.getTypePair
    );
  }

  method get_value_from is also<get-value-from> {
    adw_spring_animation_get_value_from($!adw-sa);
  }

  method get_value_to is also<get-value-to> {
    adw_spring_animation_get_value_to($!adw-sa);
  }

  method get_velocity is also<get-velocity> {
    adw_spring_animation_get_velocity($!adw-sa);
  }

  method set_clamp (Int() $clamp) is also<set-clamp> {
    my gboolean $c = $clamp.so.Int;

    adw_spring_animation_set_clamp($!adw-sa, $clamp);
  }

  method set_epsilon (Num() $epsilon) is also<set-epsilon> {
    my gdouble $e = $epsilon;

    adw_spring_animation_set_epsilon($!adw-sa, $e);
  }

  method set_initial_velocity (Num() $velocity) is also<set-initial-velocity> {
    my gdouble $v = $velocity;

    adw_spring_animation_set_initial_velocity($!adw-sa, $v);
  }

  method set_spring_params (AdwSpringParams()$spring_params)
    is also<set-spring-params>
  {
    adw_spring_animation_set_spring_params($!adw-sa, $spring_params);
  }

  method set_value_from (Num() $value) is also<set-value-from> {
    my gdouble $v = $value;

    adw_spring_animation_set_value_from($!adw-sa, $v);
  }

  method set_value_to (Num() $value) is also<set-value-to> {
    my gdouble $v = $value;

    adw_spring_animation_set_value_to($!adw-sa, $v);
  }

}
