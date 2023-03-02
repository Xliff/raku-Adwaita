use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Leaflet;

use GTK::Widget:ver<4>;
use Adwaita::SpringParams;

use GLib::Roles::Implementor;
use GTK::Roles::SelectionModel:ver<4>;

our subset AdwLeafletAncestry is export of Mu
  where AdwLeaflet | GtkWidgetAncestry;

class Adwiata::Leaflet is GTK::Widget:ver<4> {
  has AdwLeaflet $!adw-l is implementor;

  submethod BUILD ( :$adw-leaflet ) {
    self.setAdwLeaflet($adw-leaflet) if $adw-leaflet
  }

  method setAdwLeaflet (AdwLeafletAncestry $_) {
    my $to-parent;

    $!adw-l = do {
      when AdwLeaflet {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwLeaflet, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwLeaflet
    is also<AdwLeaflet>
  { $!adw-l }

  multi method new (
    $adw-leaflet where * ~~ AdwLeafletAncestry,

    :$ref = True
  ) {
    return unless $adw-leaflet;

    my $o = self.bless( :$adw-leaflet );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-leaflet = adw_leaflet_new();

    my $o = $adw-leaflet ?? self.bless( :$adw-leaflet ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method can-navigate-back is rw  is g-property is also<can_navigate_back> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('can-navigate-back', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('can-navigate-back', $gv);
      }
    );
  }

  # Type: boolean
  method can-navigate-forward
    is rw
    is g-property
    is also<can_navigate_forward>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('can-navigate-forward', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('can-navigate-forward', $gv);
      }
    );
  }

  # Type: boolean
  method can-unfold is rw  is g-property is also<can_unfold> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('can-unfold', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('can-unfold', $gv);
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

  # Type: AdwSpringParams
  method child-transition-params ( :$raw = False )
    is rw
    is g-property
    is also<child_transition_params>
  {
    my $gv = GLib::Value.new( Adwaita::SpringParams.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child-transition-params', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::SpringParams.getTypePair
        );
      },
      STORE => -> $, AdwSpringParams() $val is copy {
        $gv.object = $val;
        self.prop_set('child-transition-params', $gv);
      }
    );
  }

  # Type: boolean
  method child-transition-running
    is rw
    is g-property
    is also<child_transition_running>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child-transition-running', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'child-transition-running does not allow writing'
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

  # Type: uint
  method mode-transition-duration
    is rw
    is g-property
    is also<mode_transition_duration>
  {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('mode-transition-duration', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('mode-transition-duration', $gv);
      }
    );
  }

  # Type: string
  method name is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('name', $gv);
      }
    );
  }

  # Type: boolean
  method navigatable is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('navigatable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('navigatable', $gv);
      }
    );
  }

  # Type: AdwSelectionModel
  method pages ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::SelectionModel.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pages', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::SelectionModel.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'pages does not allow writing'
      }
    );
  }

  # Type: AdwLeafletTransitionType
  method transition-type ( :$enum = True )
    is rw
    is g-property
    is also<transition_type>
  {
    my $gv = GLib::Value.new-enum( AdwLeafletTransitionType );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transition-type', $gv);
        my $t = $gv.enum;
        return $t unless $enum;
        AdwLeafletTransitionTypeEnum($t);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwLeafletTransitionType) = $val;
        self.prop_set('transition-type', $gv);
      }
    );
  }

  # Type: GtkWidget
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
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('visible-child', $gv);
      }
    );
  }

  # Type: string
  method visible-child-name
    is rw
    is g-property
    is also<visible_child_name>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible-child-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('visible-child-name', $gv);
      }
    );
  }

  method append (GtkWidget() $child) {
    #self.addBuildableChild($child);
    adw_leaflet_append($!adw-l, $child);
  }

  method get_adjacent_child (Int() $direction)
    is also<get-adjacent-child>
  {
    my AdwNavigationDirection $d = $direction;

    adw_leaflet_get_adjacent_child($!adw-l, $d);
  }

  method get_can_navigate_back is also<get-can-navigate-back> {
    so adw_leaflet_get_can_navigate_back($!adw-l);
  }

  method get_can_navigate_forward is also<get-can-navigate-forward> {
    so adw_leaflet_get_can_navigate_forward($!adw-l);
  }

  method get_can_unfold is also<get-can-unfold> {
    so adw_leaflet_get_can_unfold($!adw-l);
  }

  method get_child_by_name (
    Str()  $name,
          :$raw           = False,
          :quick(:$fast)  = False,
          :slow(:$proper) = $fast.not
  )
    is also<get-child-by-name>
  {
    returnProperWidget(
      adw_leaflet_get_child_by_name($!adw-l, $name),
      $raw,
      $proper
    );
  }

  method get_child_transition_params ( :$raw = False )
    is also<get-child-transition-params>
  {
    propReturnObject(
      adw_leaflet_get_child_transition_params($!adw-l),
      $raw,
      |Adwaita::SpringParams.getTypePair
    );
  }

  method get_child_transition_running
    is also<get-child-transition-running>
  {
    so adw_leaflet_get_child_transition_running($!adw-l);
  }

  method get_fold_threshold_policy ( :$enum = True )
    is also<get-fold-threshold-policy>
  {
    my $p = adw_leaflet_get_fold_threshold_policy($!adw-l);
    return $p unless $enum;
    AdwFoldThresholdPolicyEnum($p);
  }

  method get_folded is also<get-folded> {
    so adw_leaflet_get_folded($!adw-l);
  }

  method get_homogeneous is also<get-homogeneous> {
    so adw_leaflet_get_homogeneous($!adw-l);
  }

  method get_mode_transition_duration
    is also<get-mode-transition-duration>
  {
    adw_leaflet_get_mode_transition_duration($!adw-l);
  }

  method get_page (GtkWidget() $child, :$raw = False) is also<get-page> {
    propReturnObject(
      adw_leaflet_get_page($!adw-l, $child),
      $raw,
      |Adwaita::Leaflet::Page.getTypePair
    )
  }

  method get_pages ( :$raw = False ) is also<get-pages> {
    propReturnObject(
      adw_leaflet_get_pages($!adw-l),
      $raw,
      |GTK::SelectionModel.getTypePair
    );
  }

  method get_transition_type is also<get-transition-type> {
    adw_leaflet_get_transition_type($!adw-l);
  }

  method get_visible_child is also<get-visible-child> {
    adw_leaflet_get_visible_child($!adw-l);
  }

  method get_visible_child_name is also<get-visible-child-name> {
    adw_leaflet_get_visible_child_name($!adw-l);
  }

  method insert_child_after (GtkWidget() $child, GtkWidget() $sibling)
    is also<insert-child-after>
  {
    adw_leaflet_insert_child_after($!adw-l, $child, $sibling);
  }

  method navigate (Int() $direction) {
    my AdwNavigationDirection $d = $direction;

    adw_leaflet_navigate($!adw-l, $d);
  }

  method prepend (GtkWidget() $child) {
    #self.prependBuildableChild($child)
    adw_leaflet_prepend($!adw-l, $child);
  }

  method remove (GtkWidget() $child) {
    #self.removeBuildableChild($child);
    adw_leaflet_remove($!adw-l, $child);
  }

  method reorder_child_after (GtkWidget() $child, GtkWidget() $sibling)
    is also<reorder-child-after>
  {
    #self.reorderBuildableChild($child, $sibling, type => 'after')
    adw_leaflet_reorder_child_after($!adw-l, $child, $sibling);
  }

  method set_can_navigate_back (Int() $can_navigate_back)
    is also<set-can-navigate-back>
  {
    my gboolean $c = $can_navigate_back.so.Int;

    adw_leaflet_set_can_navigate_back($!adw-l, $c);
  }

  method set_can_navigate_forward (Int() $can_navigate_forward)
    is also<set-can-navigate-forward>
  {
    my gboolean $c = $can_navigate_forward.so.Int;

    adw_leaflet_set_can_navigate_forward($!adw-l, $c);
  }

  method set_can_unfold (Int() $can_unfold) is also<set-can-unfold> {
    my gboolean $c = $can_unfold.so.Int;

    adw_leaflet_set_can_unfold($!adw-l, $c);
  }

  method set_child_transition_params (AdwSpringParams() $params)
    is also<set-child-transition-params>
  {
    adw_leaflet_set_child_transition_params($!adw-l, $params);
  }

  method set_fold_threshold_policy (Int() $policy)
    is also<set-fold-threshold-policy>
  {
    my AdwFoldThresholdPolicy $p = $policy;

    adw_leaflet_set_fold_threshold_policy($!adw-l, $p);
  }

  method set_homogeneous (Int() $homogeneous) is also<set-homogeneous> {
    my gboolean $h = $homogeneous.so.Int;

    adw_leaflet_set_homogeneous($!adw-l, $h);
  }

  method set_mode_transition_duration (Int() $duration)
    is also<set-mode-transition-duration>
  {
    my guint $d = $duration;

    adw_leaflet_set_mode_transition_duration($!adw-l, $d);
  }

  method set_transition_type (Int() $transition)
    is also<set-transition-type>
  {
    my AdwLeafletTransitionType $t = $transition;

    adw_leaflet_set_transition_type($!adw-l, $t);
  }

  method set_visible_child (GtkWidget() $visible_child)
    is also<set-visible-child>
  {
    adw_leaflet_set_visible_child($!adw-l, $visible_child);
  }

  method set_visible_child_name (Str() $name)
    is also<set-visible-child-name>
  {
    adw_leaflet_set_visible_child_name($!adw-l, $name);
  }

}

our subset AdwLeafletPageAncestry is export of Mu
  where AdwLeafletPage | GtkWidgetAncestry;

class Adwaita::Leaflet::Page {
  has AdwLeafletPage $!adw-lp is implementor;

  submethod BUILD ( :$adw-leaflet-page ) {
    self.setAdwLeafletPage($adw-leaflet-page) if $adw-leaflet-page
  }

  method setAdwLeafletPage (AdwLeafletPageAncestry $_) {
    my $to-parent;

    $!adw-lp = do {
      when AdwLeafletPage {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwLeafletPage, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwLeafletPage
    is also<AdwLeafletPage>
  { $!adw-lp }

  multi method new (
    $adw-leaflet-page where * ~~ AdwLeafletPageAncestry,

    :$ref = True
  ) {
    return unless $adw-leaflet-page;

    my $o = self.bless( :$adw-leaflet-page );
    $o.ref if $ref;
    $o;
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_leaflet_page_get_child($!adw-lp),
      $raw,
      $proper
    );
  }

  method get_name is also<get-name> {
    adw_leaflet_page_get_name($!adw-lp);
  }

  method get_navigatable is also<get-navigatable> {
    so adw_leaflet_page_get_navigatable($!adw-lp);
  }

  method set_name (Str() $name) is also<set-name> {
    adw_leaflet_page_set_name($!adw-lp, $name);
  }

  method set_navigatable (Int() $navigatable) is also<set-navigatable> {
    my gboolean $n = $navigatable.so.Int;

    adw_leaflet_page_set_navigatable($!adw-lp, $navigatable);
  }

}
