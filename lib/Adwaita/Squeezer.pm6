use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Squeezer;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;
use GTK::Roles::SelectionModel:ver<4>;

our subset AdwSqueezerAncestry is export of Mu
  where AdwSqueezer | GtkWidgetAncestry;

class Adwaita::Squeezer is GTK::Widget:ver<4> {
  has AdwSqueezer $!adw-s is implementor;

  submethod BUILD ( :$adw-squeezer ) {
    self.setAdwSqueezer($adw-squeezer) if $adw-squeezer
  }

  method setAdwSqueezer (AdwSqueezerAncestry $_) {
    my $to-parent;

    $!adw-s = do {
      when AdwSqueezer {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSqueezer, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSqueezer
    is also<AdwSqueezer>
  { $!adw-s }

  multi method new (
    $adw-squeezer where * ~~ AdwSqueezerAncestry,

    :$ref = True
  ) {
    return unless $adw-squeezer;

    my $o = self.bless( :$adw-squeezer );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-squeezer = adw_squeezer_new();

    my $o = $adw-squeezer ?? self.bless( :$adw-squeezer ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method allow-none is rw  is g-property is also<allow_none> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-none', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-none', $gv);
      }
    );
  }

  # Type: AdwWidget
  method child (
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
        self.prop_get('child', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('child', $gv);
      }
    );
  }

  # Type: boolean
  method homogeneous is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('homogeneous', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('homogeneous', $gv);
      }
    );
  }

  # Type: boolean
  method interpolate-size
    is rw
    is g-property
    is also<interpolate_size>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('interpolate-size', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('interpolate-size', $gv);
      }
    );
  }

  # Type: AdwSelectionModel
  method pages (
    :$raw           = False,
    :$model         = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( GTK::Selection::Model.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pages', $gv);
        my $o = propReturnObject(
          $gv.object,
          $raw,
          |GTK::Selection::Model.getTypePair
        );
        return $o if $model;
        my @types = (GtkWidget);
        @types.push: GTK::Widget if $fast;
        $o .= to_array( |@types );
        return $o unless $proper;
        return $o if     $raw;
        $o.map({ returnProperWidget($_, $raw, $proper) });
      },
      STORE => -> $,  $val is copy {
        warn 'pages does not allow writing'
      }
    );
  }

  # Type: AdwFoldThresholdPolicy
  method switch-threshold-policy ( :$enum = True )
    is rw
    is g-property

    is also<switch_threshold_policy>
  {
    my $gv = GLib::Value.new-enum( AdwFoldThresholdPolicy );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('switch-threshold-policy', $gv);
        my $p = $gv.enum;
        return $p unless $enum;
        AdwFoldThresholdPolicyEnum($p);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwFoldThresholdPolicy) = $val;
        self.prop_set('switch-threshold-policy', $gv);
      }
    );
  }

  # Type: uint
  method transition-duration
    is rw
    is g-property
    is also<transition_duration>
  {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transition-duration', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('transition-duration', $gv);
      }
    );
  }

  # Type: boolean
  method transition-running
    is rw
    is g-property
    is also<transition_running>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transition-running', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'transition-running does not allow writing'
      }
    );
  }

  # Type: AdwSqueezerTransitionType
  method transition-type ( :$enum = True )
    is rw
    is g-property
    is also<transition_type>
  {
    my $gv = GLib::Value.new-enum( AdwSqueezerTransitionType );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transition-type', $gv);
        my $t = $$gv.enum;
        return $t unless $enum;
        AdwSqueezerTransitionTypeEnum($t);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwSqueezerTransitionType) = $val;
        self.prop_set('transition-type', $gv);
      }
    );
  }

  # Type: AdwWidget
  method visible-child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property

    is also<visible_child>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible-child', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $,  $val is copy {
        warn 'visible-child does not allow writing'
      }
    );
  }

  # Type: float
  method xalign is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('xalign', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('xalign', $gv);
      }
    );
  }

  # Type: float
  method yalign is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('yalign', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('yalign', $gv);
      }
    );
  }

  method add (GtkWidget() $child) {
    #self.addBuildableChild($child);
    adw_squeezer_add($!adw-s, $child);
  }

  method get_allow_none is also<get-allow-none> {
    so adw_squeezer_get_allow_none($!adw-s);
  }

  method get_homogeneous is also<get-homogeneous> {
    so adw_squeezer_get_homogeneous($!adw-s);
  }

  method get_interpolate_size is also<get-interpolate-size> {
    adw_squeezer_get_interpolate_size($!adw-s);
  }

  method get_page (GtkWidget() $child, :$raw = False) is also<get-page> {
    propReturnObject(
      adw_squeezer_get_page($!adw-s, $child),
      $raw,
      |::('Adwaita::Squeezer::Page').getTypePair
    );
  }

  method get_pages (
    :$raw           = False,
    :$model         = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-pages>
  {
    my $o = propReturnObject(
      adw_squeezer_get_pages($!adw-s),
      $raw,
      |GTK::Selection::Model.getTypePair
    );
    return $o if $model;
    my @types = (GtkWidget);
    @types.push: GTK::Widget if $fast;
    $o .= to_array( |@types );
    return $o unless $proper;
    return $o if     $raw;
    $o.map({ returnProperWidget($_, $raw, $proper) });
  }

  method get_switch_threshold_policy ( :$enum = True )
    is also<get-switch-threshold-policy>
  {
    my $p = adw_squeezer_get_switch_threshold_policy($!adw-s);
    return $p unless $enum;
    AdwFoldThresholdPolicyEnum($p);
  }

  method get_transition_duration is also<get-transition-duration> {
    adw_squeezer_get_transition_duration($!adw-s);
  }

  method get_transition_running is also<get-transition-running> {
    so adw_squeezer_get_transition_running($!adw-s);
  }

  method get_transition_type ( :$enum = True )
    is also<get-transition-type>
  {
    my $t = adw_squeezer_get_transition_type($!adw-s);
    return $t unless $enum;
    AdwSqueezerTransitionTypeEnum($t);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_squeezer_get_type, $n, $t );
  }

  method get_visible_child is also<get-visible-child> {
    adw_squeezer_get_visible_child($!adw-s);
  }

  method get_xalign is also<get-xalign> {
    adw_squeezer_get_xalign($!adw-s);
  }

  method get_yalign is also<get-yalign> {
    adw_squeezer_get_yalign($!adw-s);
  }

  method remove (GtkWidget() $child) {
    #self.removeBuildableChild($child);
    adw_squeezer_remove($!adw-s, $child);
  }

  method set_allow_none (Int() $allow_none) is also<set-allow-none> {
    my gboolean $a = $allow_none.so.Int;

    adw_squeezer_set_allow_none($!adw-s, $a);
  }

  method set_homogeneous (Int() $homogeneous) is also<set-homogeneous> {
    my gboolean $h = $homogeneous.so.Int;

    adw_squeezer_set_homogeneous($!adw-s, $h);
  }

  method set_interpolate_size (Int() $interpolate_size)
    is also<set-interpolate-size>
  {
    my gboolean $i = $interpolate_size.so.Int;

    adw_squeezer_set_interpolate_size($!adw-s, $i);
  }

  method set_switch_threshold_policy (Int() $policy)
    is also<set-switch-threshold-policy>
  {
    my AdwFoldThresholdPolicy $p = $policy;

    adw_squeezer_set_switch_threshold_policy($!adw-s, $p);
  }

  method set_transition_duration (Int() $duration)
    is also<set-transition-duration>
  {
    my guint $d = $duration;

    adw_squeezer_set_transition_duration($!adw-s, $d);
  }

  method set_transition_type (Int() $transition)
    is also<set-transition-type>
  {
    my AdwSqueezerTransitionType $t = $transition;

    adw_squeezer_set_transition_type($!adw-s, $t);
  }

  method set_xalign (Num() $xalign) is also<set-xalign> {
    my gfloat $x = $xalign;

    adw_squeezer_set_xalign($!adw-s, $x);
  }

  method set_yalign (Num() $yalign) is also<set-yalign> {
    my gfloat $y = $yalign;

    adw_squeezer_set_yalign($!adw-s, $y);
  }

}


our subset AdwSqueezerPageAncestry is export of Mu
  where AdwSqueezerPage | GtkWidgetAncestry;

class Adwaita::Squeezer::Page is GTK::Widget:ver<4> {
  has AdwSqueezerPage $!adw-sp is implementor;

  submethod BUILD ( :$adw-squeezer-page ) {
    self.setAdwSqueezerPage($adw-squeezer-page) if $adw-squeezer-page
  }

  method setAdwSqueezerPage (AdwSqueezerPageAncestry $_) {
    my $to-parent;

    $!adw-sp = do {
      when AdwSqueezerPage {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwSqueezerPage, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwSqueezerPage
    is also<AdwSqueezerPage>
  { $!adw-sp }

  method new (
    $adw-squeezer-page where * ~~ AdwSqueezerPageAncestry,

    :$ref = True
  ) {
    return unless $adw-squeezer-page;

    my $o = self.bless( :$adw-squeezer-page );
    $o.ref if $ref;
    $o;
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

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_squeezer_page_get_child($!adw-sp),
      $raw,
      $proper
    );
  }

  method get_enabled is also<get-enabled> {
    so adw_squeezer_page_get_enabled($!adw-sp);
  }

  method set_enabled (Int() $enabled) is also<set-enabled> {
    my gboolean $e = $enabled.so.Int;

    adw_squeezer_page_set_enabled($!adw-sp, $e);
  }
}
