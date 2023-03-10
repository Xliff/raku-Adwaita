use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Flap;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwFlapAncestry is export of Mu
  where AdwFlap | GtkWidgetAncestry;

class Adwaita::Flap is GTK::Widget:ver<4> {
  has AdwFlap $!adw-f is implementor;

  submethod BUILD ( :$adw-flap ) {
    self.setAdwFlap($adw-flap) if $adw-flap
  }

  method setAdwFlap (AdwFlapAncestry $_) {
    my $to-parent;

    $!adw-f = do {
      when AdwFlap {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwFlap, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwFlap
  { $!adw-f }

  multi method new ($adw-flap where * ~~ AdwFlapAncestry , :$ref = True) {
    return unless $adw-flap;

    my $o = self.bless( :$adw-flap );
    $o.ref if $ref;
    $o;    # cw: Must also write to the proper root directory. That being
    #     the main directory in which the compunit lies.


  }
  multi method new ( *%a ) {
    my $adw-flap = adw_flap_new();

    my $o = $adw-flap ?? self.bless( :$adw-flap ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: AdwWidget
  method content (
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
        self.prop_get('content', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('content', $gv);
      }
    );
  }

  # Type: AdwWidget
  method flap (
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
        self.prop_get('flap', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('flap', $gv);
      }
    );
  }

  # Type: AdwPackType
  method flap-position ( :$enum = True )
    is rw
    is g-property
    is also<flap_position>
  {
    my $gv = GLib::Value.new-enum( GtkPackType );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('flap-position', $gv);
        my $p = $gv.enum;
        return $p unless $enum;
        GtkPackTypeEnum($p);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GtkPackType) = $val;
        self.prop_set('flap-position', $gv);
      }
    );
  }

  # Type: uint
  method fold-duration is rw  is g-property is also<fold_duration> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fold-duration', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('fold-duration', $gv);
      }
    );
  }

  # Type: AdwFlapFoldPolicy
  method fold-policy ( :$enum = True )
    is rw
    is g-property
    is also<fold_policy>
  {
    my $gv = GLib::Value.new-enum( AdwFlapFoldPolicy );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fold-policy', $gv);
        my $p = $gv.enum;
        return $p unless $enum;
        AdwFlapFoldPolicyEnum($p);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwFlapFoldPolicy) = $val;
        self.prop_set('fold-policy', $gv);
      }
    );
  }

  # Type: AdwFoldThresholdPolicy
  method fold-threshold-policy ( :$enum = True )
    is rw
    is g-property
    is also<fold_threshold_policy>
  {
    my $gv = GLib::Value.new-enum( AdwFoldThresholdPolicy );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fold-threshold-policy', $gv);
        my $p = $gv.enum;
        return $p unless $enum;
        AdwFoldThresholdPolicyEnum($p);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwFoldThresholdPolicy) = $val;
        self.prop_set('fold-threshold-policy', $gv);
      }
    );
  }

  # Type: boolean
  method folded is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('folded', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'folded does not allow writing'
      }
    );
  }

  # Type: boolean
  method locked is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('locked', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('locked', $gv);
      }
    );
  }

  # Type: boolean
  method modal is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('modal', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('modal', $gv);
      }
    );
  }

  # Type: boolean
  method reveal-flap is rw  is g-property is also<reveal_flap> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reveal-flap', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('reveal-flap', $gv);
      }
    );
  }

  # Type: AdwSpringParams
  method reveal-params ( :$raw = False )
    is rw
    is g-property
    is also<reveal_params>
  {
    my $gv = GLib::Value.new( Adwaita::SpringParams.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reveal-params', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::SpringParams.getTypePair
        );
      },
      STORE => -> $, AdwSpringParams() $val is copy {
        $gv.object = $val;
        self.prop_set('reveal-params', $gv);
      }
    );
  }

  # Type: double
  method reveal-progress is rw  is g-property is also<reveal_progress> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reveal-progress', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        warn 'reveal-progress does not allow writing'
      }
    );
  }

  # Type: AdwWidget
  method separator (
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
        self.prop_get('separator', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('separator', $gv);
      }
    );
  }

  # Type: boolean
  method swipe-to-close is rw  is g-property is also<swipe_to_close> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('swipe-to-close', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('swipe-to-close', $gv);
      }
    );
  }

  # Type: boolean
  method swipe-to-open is rw  is g-property is also<swipe_to_open> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('swipe-to-open', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('swipe-to-open', $gv);
      }
    );
  }

  # Type: AdwFlapTransitionType
  method transition-type ( :$enum = True )
    is rw
    is g-property
    is also<transition_type>
  {
    my $gv = GLib::Value.new-enum( AdwFlapTransitionType );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transition-type', $gv);
        my $t = $gv.enum;
        return $t unless $enum;
        AdwFlapTransitionTypeEnum($t)
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwFlapTransitionType) = $val;
        self.prop_set('transition-type', $gv);
      }
    );
  }

  method get_content (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-content>
  {
    returnProperWidget(
      adw_flap_get_content($!adw-f),
      $raw,
      $proper
    );
  }

  method get_flap (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-flap>
  {
    returnProperWidget(
      adw_flap_get_flap($!adw-f),
      $raw,
      $proper
    );
  }

  method get_flap_position ( :$enum = True ) is also<get-flap-position> {
    my $p = adw_flap_get_flap_position($!adw-f);
    return $p unless $enum;
    GtkPackTypeEnum($p);
  }

  method get_fold_duration is also<get-fold-duration> {
    adw_flap_get_fold_duration($!adw-f);
  }

  method get_fold_policy ( :$enum = True ) is also<get-fold-policy> {
    my $p = adw_flap_get_fold_policy($!adw-f);
    return unless $enum;
    AdwFlapFoldPolicyEnum($p);
  }

  method get_fold_threshold_policy ( :$enum = True )
    is also<get-fold-threshold-policy>
  {
    my $p = adw_flap_get_fold_threshold_policy($!adw-f);
    return unless $enum;
    AdwFoldThresholdPolicyEnum($p);
  }

  method get_folded is also<get-folded> {
    so adw_flap_get_folded($!adw-f);
  }

  method get_locked is also<get-locked> {
    so adw_flap_get_locked($!adw-f);
  }

  method get_modal is also<get-modal> {
    so adw_flap_get_modal($!adw-f);
  }

  method get_reveal_flap is also<get-reveal-flap> {
    so adw_flap_get_reveal_flap($!adw-f);
  }

  method get_reveal_params ( :$raw = False ) is also<get-reveal-params> {
    propReturnObject(
      adw_flap_get_reveal_params($!adw-f),
      $raw,
      |Adwaita::SpringParams.getTypePair
    );
  }

  method get_reveal_progress is also<get-reveal-progress> {
    adw_flap_get_reveal_progress($!adw-f);
  }

  method get_separator (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-separator>
  {
    adw_flap_get_separator($!adw-f);
  }

  method get_swipe_to_close is also<get-swipe-to-close> {
    so adw_flap_get_swipe_to_close($!adw-f);
  }

  method get_swipe_to_open is also<get-swipe-to-open> {
    so adw_flap_get_swipe_to_open($!adw-f);
  }

  method get_transition_type ( :$enum = False )
    is also<get-transition-type>
  {
    my $t = adw_flap_get_transition_type($!adw-f);
    return $t unless $enum;
    AdwFlapTransitionTypeEnum($t);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_flap_get_type, $n, $t );
  }

  method set_content (GtkWidget() $content) is also<set-content> {
    adw_flap_set_content($!adw-f, $content);
  }

  method set_flap (GtkWidget() $flap) is also<set-flap> {
    adw_flap_set_flap($!adw-f, $flap);
  }

  method set_flap_position (Int() $position) is also<set-flap-position> {
    my GtkPackType $p = $position;

    adw_flap_set_flap_position($!adw-f, $p);
  }

  method set_fold_duration (Int() $duration) is also<set-fold-duration> {
    my guint $d = $duration;

    adw_flap_set_fold_duration($!adw-f, $d);
  }

  method set_fold_policy (Int() $policy) is also<set-fold-policy> {
    my AdwFlapFoldPolicy $p = $policy;

    adw_flap_set_fold_policy($!adw-f, $p);
  }

  method set_fold_threshold_policy (Int() $policy)
    is also<set-fold-threshold-policy>
  {
    my AdwFoldThresholdPolicy $p = $policy;

    adw_flap_set_fold_threshold_policy($!adw-f, $p);
  }

  method set_locked (Int() $locked) is also<set-locked> {
    my gboolean $l = $locked.so.Int;

    adw_flap_set_locked($!adw-f, $l);
  }

  method set_modal (Int() $modal) is also<set-modal> {
    my gboolean $m = $modal.so.Int;

    adw_flap_set_modal($!adw-f, $m);
  }

  method set_reveal_flap (Int() $reveal_flap) is also<set-reveal-flap> {
    my gboolean $r = $reveal_flap.so.Int;

    adw_flap_set_reveal_flap($!adw-f, $r);
  }

  method set_reveal_params (Int() $params) is also<set-reveal-params> {
    my AdwSpringParams $p = $params;

    adw_flap_set_reveal_params($!adw-f, $p);
  }

  method set_separator (GtkWidget() $separator) is also<set-separator> {
    adw_flap_set_separator($!adw-f, $separator);
  }

  method set_swipe_to_close (Int() $swipe_to_close)
    is also<set-swipe-to-close>
  {
    my gboolean $s = $swipe_to_close.so.Int;

    adw_flap_set_swipe_to_close($!adw-f, $s);
  }

  method set_swipe_to_open (Int() $swipe_to_open) is also<set-swipe-to-open> {
    my gboolean $s = $swipe_to_open.so.Int;

    adw_flap_set_swipe_to_open($!adw-f, $s);
  }

  method set_transition_type (Int() $transition_type)
    is also<set-transition-type>
  {
    my AdwFlapTransitionType $t = $transition_type;

    adw_flap_set_transition_type($!adw-f, $t);
  }

}
