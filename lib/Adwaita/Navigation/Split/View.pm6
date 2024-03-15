use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Navigation::Split::View;

use GTK::Widget:ver<4>;
use Adwaita::Navigation;

use GLib::Roles::Implementor;

our subset AdwNavigationSideViewAncestry is export of Mu
  where AdwNavigationSplitView | GtkWidgetAncestry;

class Adwaita::Navigation::Split::View is GTK::Widget {
  has AdwNavigationSplitView $!adw-nsv is implementor;

  submethod BUILD ( :$adw-nav-view ) {
    self.setAdwNavigationSideView($adw-nav-view) if $adw-nav-view
  }

  method setAdwNavigationSideView (AdwNavigationSideViewAncestry $_) {
    my $to-parent;

    $!adw-nsv = do {
      when AdwNavigationSplitView {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwNavigationSplitView, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwNavigationSideView
    is also<AdwNavigationSideView>
  { $!adw-nsv }

  multi method new (
     $adw-nav-view where * ~~ AdwNavigationSideViewAncestry,

    :$ref                                                    = True
  ) {
    return unless $adw-nav-view;

    my $o = self.bless( :$adw-nav-view );
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $adwaita-nav-view = adw_navigation_split_view_new();

    $adwaita-nav-view ?? self.bless( :$adwaita-nav-view ) !! Nil;
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

  # Type: AdwNavigationPage
  method content ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Adwaita::Navigation::Page.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Navigation::Page.getTypePair
        );
      },
      STORE => -> $, AdwNavigationPage() $val is copy {
        $gv.object = $val;
        self.prop_set('content', $gv);
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
  method show-content is rw  is g-property is also<show_content> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-content', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-content', $gv);
      }
    );
  }

  # Type: AdwNavigationPage
  method sidebar ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Adwaita::Navigation::Page.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sidebar', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Navigation::Page.getTypePair
        );
      },
      STORE => -> $, AdwNavigationPage() $val is copy {
        $gv.object = $val;
        self.prop_set('sidebar', $gv);
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
    my $gv = GLib::Value.new( Adwaita::Enums::LengthUnit );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sidebar-width-unit', $gv);
        my $s = $gv.enum;
        return $s unless $enum;
        AdwLengthUnitEnum($s);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwLengthUnit) = $val;
        self.prop_set('sidebar-width-unit', $gv);
      }
    );
  }

  method get_collapsed is also<get-collapsed> {
    so adw_navigation_split_view_get_collapsed($!adw-nsv);
  }

  method get_content ( :$raw = False ) is also<get-content> {
    propReturnObject(
      adw_navigation_split_view_get_content($!adw-nsv),
      $raw,
      |Adwaita::Navigation::Page.getTypePair
    );
  }

  method get_max_sidebar_width is also<get-max-sidebar-width> {
    adw_navigation_split_view_get_max_sidebar_width($!adw-nsv);
  }

  method get_min_sidebar_width is also<get-min-sidebar-width> {
    adw_navigation_split_view_get_min_sidebar_width($!adw-nsv);
  }

  method get_show_content is also<get-show-content> {
    so adw_navigation_split_view_get_show_content($!adw-nsv);
  }

  method get_sidebar ( :$raw = False ) is also<get-sidebar> {
    propReturnObject(
      adw_navigation_split_view_get_sidebar($!adw-nsv),
      $raw,
      |Adwaita::Navigation::Page.getTypePair
    );
  }

  method get_sidebar_width_fraction is also<get-sidebar-width-fraction> {
    adw_navigation_split_view_get_sidebar_width_fraction($!adw-nsv);
  }

  method get_sidebar_width_unit is also<get-sidebar-width-unit> {
    adw_navigation_split_view_get_sidebar_width_unit($!adw-nsv);
  }

  method set_collapsed (Int() $collapsed) is also<set-collapsed> {
    my gboolean $c = $collapsed;

    adw_navigation_split_view_set_collapsed($!adw-nsv, $c);
  }

  method set_content (AdwNavigationPage() $content) is also<set-content> {
    adw_navigation_split_view_set_content($!adw-nsv, $content);
  }

  method set_max_sidebar_width (Num() $width) is also<set-max-sidebar-width> {
    my gdouble $w = $width;

    adw_navigation_split_view_set_max_sidebar_width($!adw-nsv, $w);
  }

  method set_min_sidebar_width (Num() $width) is also<set-min-sidebar-width> {
    my gdouble $w = $width;

    adw_navigation_split_view_set_min_sidebar_width($!adw-nsv, $w);
  }

  method set_show_content (Int() $show_content) is also<set-show-content> {
    my gboolean $s = $show_content;

    adw_navigation_split_view_set_show_content($!adw-nsv, $s);
  }

  method set_sidebar (AdwNavigationPage() $sidebar) is also<set-sidebar> {
    my AdwNavigationPage $s = $sidebar;

    adw_navigation_split_view_set_sidebar($!adw-nsv, $s);
  }

  method set_sidebar_width_fraction (Num() $fraction)
    is also<set-sidebar-width-fraction>
  {
    my gdouble $f = $fraction;

    adw_navigation_split_view_set_sidebar_width_fraction($!adw-nsv, $f);
  }

  method set_sidebar_width_unit (Int() $unit) is also<set-sidebar-width-unit> {
    my AdwLengthUnit $u = $unit;

    adw_navigation_split_view_set_sidebar_width_unit($!adw-nsv, $u);
  }

}
