use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Animation;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AdwAnimationAncestry is export of Mu
  where AdwAnimation | GObject;

class Adwaita::Animation {
  also does GLib::Roles::Object;

  has AdwAnimation $!adw-a is implementor;

  submethod BUILD ( :$adw-animation ) {
    self.setAdwAnimation($adw-animation) if $adw-animation
  }

  method setAdwAnimation (AdwAnimationAncestry $_) {
    my $to-parent;

    $!adw-a = do {
      when AdwAnimation {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwAnimation, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwAnimation
    is also<AdwAnimation>
  { $!adw-a }

  multi method new (
    $adw-animation where * ~~ AdwAnimationAncestry,

    :$ref = True
  ) {
    return unless $adw-animation;

    my $o = self.bless( :$adw-animation );
    $o.ref if $ref;
    $o;
  }

  # Type: AdwAnimationState
  method state ( :$enum = True ) is rw  is g-property {
    my $gv = GLib::Value.new-enum( AdwAnimationState );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('state', $gv);
        my $s = $gv.enum;
        return $s unless $enum;
        AdwAnimationStateEnum($s);
      },
      STORE => -> $,  $val is copy {
        warn 'state does not allow writing'
      }
    );
  }

  # Type: AdwAnimationTarget
  method target ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Adwaita::Animation::Target.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('target', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Animation::Target.getTypePair
        );
      },
      STORE => -> $, AdwAnimationTarget() $val is copy {
        $gv.object = $val;
        self.prop_set('target', $gv);
      }
    );
  }

  # Type: double
  method value is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('value', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        warn 'value does not allow writing'
      }
    );
  }

  # Type: AdwWidget
  method widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('widget', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('widget', $gv);
      }
    );
  }

  method Done {
    self.connect($!adw-a, 'done');
  }

  method get_state ( :$enum = True ) is also<get-state> {
    my $s = adw_animation_get_state($!adw-a);
    return $s unless $enum;
    AdwAnimationStateEnum($s);
  }

  method get_target ( :$raw = False ) is also<get-target> {
    propReturnObject(
      adw_animation_get_target($!adw-a),
      $raw,
      |Adwaita::Animation::Target.getTypePair
    );
  }

  method get_value is also<get-value> {
    adw_animation_get_value($!adw-a);
  }

  method get_widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-widget>
  {
    returnProperWidget(
      adw_animation_get_widget($!adw-a),
      $raw,
      $proper
    );
  }

  method pause {
    adw_animation_pause($!adw-a);
  }

  method play {
    adw_animation_play($!adw-a);
  }

  method reset {
    adw_animation_reset($!adw-a);
  }

  method resume {
    adw_animation_resume($!adw-a);
  }

  method set_target (AdwAnimationTarget() $target) is also<set-target> {
    adw_animation_set_target($!adw-a, $target);
  }

  method skip {
    adw_animation_skip($!adw-a);
  }

}
