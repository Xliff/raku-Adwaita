use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Overlay::View;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwOverlaySplitViewAncestry is export of Mu
  where AdwOverlaySplitView | GtkWidgetAncestry;

class Adwaita::Overlay::View is GTK::Widget {
  has AdwOverlaySplitView $!adw-osv is implementor;

  submethod BUILD ( :$adw-overlay-view ) {
    self.setAdwOverlaySplitView($adw-overlay-view) if $adw-overlay-view
  }

  method setAdwOverlaySplitView (AdwOverlaySplitViewAncestry $_) {
    my $to-parent;

    $!adw-osv = do {
      when AdwOverlaySplitView {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwOverlaySplitView, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwOverlaySplitView
    is also<AdwOverlaySplitView>
  { $!adw-osv }

  multi method new (
     $adw-overlay-view where * ~~ AdwOverlaySplitViewAncestry,

    :$ref                                                       = True
  ) {
    return unless $adw-overlay-view;

    my $o = self.bless( :$adw-overlay-view );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $adw-overlay-view = adw_overlay_split_view_new();

    $adw-overlay-view ?? self.bless( :$adw-overlay-view ) !! Nil;
  }

  # Type: boolean
  method collapsed is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('collapsed', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('collapsed', $gv);
      }
    );
  }

  # Type: AdwWidget
  method content (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
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
          $slow
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('content', $gv);
      }
    );
  }

  # Type: boolean
  method enable-hide-gesture
    is rw
    is g-property
    is also<enable_hide_gesture>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-hide-gesture', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-hide-gesture', $gv);
      }
    );
  }

  # Type: boolean
  method enable-show-gesture
    is rw
    is g-property
    is also<enable_show_gesture>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-show-gesture', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-show-gesture', $gv);
      }
    );
  }

  # Type: double
  method max-sidebar-width is rw  is g-property is also<max_sidebar_width> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('max-sidebar-width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('max-sidebar-width', $gv);
      }
    );
  }

  # Type: double
  method min-sidebar-width is rw  is g-property is also<min_sidebar_width> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-sidebar-width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('min-sidebar-width', $gv);
      }
    );
  }

  # Type: boolean
  method pin-sidebar is rw  is g-property is also<pin_sidebar> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pin-sidebar', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('pin-sidebar', $gv);
      }
    );
  }

  # Type: boolean
  method show-sidebar is rw  is g-property is also<show_sidebar> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-sidebar', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-sidebar', $gv);
      }
    );
  }

  # Type: AdwWidget
  method sidebar (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sidebar', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $slow
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('sidebar', $gv);
      }
    );
  }

  # Type: GtkPackType
  method sidebar-position ( :$enum = True )
    is rw
    is g-property
    is also<sidebar_position>
  {
    my $gv = GLib::Value.new( GTK::Enums::PackType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sidebar-position', $gv);
        my $t = $gv.enum;
        return $t unless $enum;
        GtkPackTypeEnum($t);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GtkPackType) = $val;
        self.prop_set('sidebar-position', $gv);
      }
    );
  }

  # Type: double
  method sidebar-width-fraction
    is rw
    is g-property
    is also<sidebar_width_fraction>
  {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sidebar-width-fraction', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('sidebar-width-fraction', $gv);
      }
    );
  }

  # Type: AdwLengthUnit
  method sidebar-width-unit ( :$enum = True )
    is rw
    is g-property
    is also<sidebar_width_unit>
  {
    my $gv = GLib::Value.new( Adwaita::Enums::LengthUnit.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sidebar-width-unit', $gv);
        my $u = $gv.enum;
        return $u unless $enum;
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwLengthUnit) = $val;
        self.prop_set('sidebar-width-unit', $gv);
      }
    );
  }

  method get_collapsed is also<get-collapsed> {
    so adw_overlay_split_view_get_collapsed($!adw-osv);
  }

  method get_content (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-content>
  {
    returnProperWidget(
      adw_overlay_split_view_get_content($!adw-osv),
      $raw,
      $slow
    );
  }

  method get_enable_hide_gesture is also<get-enable-hide-gesture> {
    adw_overlay_split_view_get_enable_hide_gesture($!adw-osv);
  }

  method get_enable_show_gesture is also<get-enable-show-gesture> {
    adw_overlay_split_view_get_enable_show_gesture($!adw-osv);
  }

  method get_max_sidebar_width is also<get-max-sidebar-width> {
    adw_overlay_split_view_get_max_sidebar_width($!adw-osv);
  }

  method get_min_sidebar_width is also<get-min-sidebar-width> {
    adw_overlay_split_view_get_min_sidebar_width($!adw-osv);
  }

  method get_pin_sidebar is also<get-pin-sidebar> {
    adw_overlay_split_view_get_pin_sidebar($!adw-osv);
  }

  method get_show_sidebar is also<get-show-sidebar> {
    so adw_overlay_split_view_get_show_sidebar($!adw-osv);
  }

  method get_sidebar (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-sidebar>
  {
    returnProperWidget(
      adw_overlay_split_view_get_sidebar($!adw-osv),
      $raw,
      $slow
    );
  }

  method get_sidebar_position ( :$enum = True ) is also<get-sidebar-position> {
    my $p = adw_overlay_split_view_get_sidebar_position($!adw-osv);
    return $p unless $enum;
    GtkPackTypeEnum($p);
  }

  method get_sidebar_width_fraction is also<get-sidebar-width-fraction> {
    adw_overlay_split_view_get_sidebar_width_fraction($!adw-osv);
  }

  method get_sidebar_width_unit ( :$enum = True )
    is also<get-sidebar-width-unit>
  {
    my $u = adw_overlay_split_view_get_sidebar_width_unit($!adw-osv);
    return $u unless $enum;
    AdwLengthUnitEnum($u)
  }

  method set_collapsed (Int() $collapsed) is also<set-collapsed> {
    my gboolean $c = $collapsed.so.Int;

    adw_overlay_split_view_set_collapsed($!adw-osv, $c);
  }

  method set_content (GtkWidget() $content) is also<set-content> {
    adw_overlay_split_view_set_content($!adw-osv, $content);
  }

  method set_enable_hide_gesture (Int() $enable_hide_gesture)
    is also<set-enable-hide-gesture>
  {
    my gboolean $e = $enable_hide_gesture.so.Int;

    adw_overlay_split_view_set_enable_hide_gesture($!adw-osv, $e);
  }

  method set_enable_show_gesture (Int() $enable_show_gesture)
    is also<set-enable-show-gesture>
  {
    my gboolean $e = $enable_show_gesture.so.Int;

    adw_overlay_split_view_set_enable_show_gesture($!adw-osv, $e);
  }

  method set_max_sidebar_width (Num() $width) is also<set-max-sidebar-width> {
    my gdouble $w = $width;

    adw_overlay_split_view_set_max_sidebar_width($!adw-osv, $w);
  }

  method set_min_sidebar_width (Num() $width) is also<set-min-sidebar-width> {
    my gdouble $w = $width;

    adw_overlay_split_view_set_min_sidebar_width($!adw-osv, $w);
  }

  method set_pin_sidebar (Int() $pin_sidebar) is also<set-pin-sidebar> {
    my gboolean $p = $pin_sidebar.so.Int;

    adw_overlay_split_view_set_pin_sidebar($!adw-osv, $p);
  }

  method set_show_sidebar (Int() $show_sidebar) is also<set-show-sidebar> {
    my gboolean $s = $show_sidebar.so.Int;

    adw_overlay_split_view_set_show_sidebar($!adw-osv, $s);
  }

  method set_sidebar (GtkWidget() $sidebar) is also<set-sidebar> {
    adw_overlay_split_view_set_sidebar($!adw-osv, $sidebar);
  }

  method set_sidebar_position (Int() $position) is also<set-sidebar-position> {
    my GtkPackType $p = $position;

    adw_overlay_split_view_set_sidebar_position($!adw-osv, $position);
  }

  method set_sidebar_width_fraction (Num() $fraction)
    is also<set-sidebar-width-fraction>
  {
    my gdouble $f = $fraction;

    adw_overlay_split_view_set_sidebar_width_fraction($!adw-osv, $f);
  }

  method set_sidebar_width_unit (Int() $unit) is also<set-sidebar-width-unit> {
    my AdwLengthUnit $u = $unit;

    adw_overlay_split_view_set_sidebar_width_unit($!adw-osv, $u);
  }

}
