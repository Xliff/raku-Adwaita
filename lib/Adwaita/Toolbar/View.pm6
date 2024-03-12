use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Toolbar::View;

use GTK::Widget:ver<4>;

our subset AdwToolbarViewAncestry is export of Mu
  where AdwToolbarView | GtkWidgetAncestry;

class Adwaita::Toolbar::View is GTK::Widget {
  has AdwToolbarView $!adw-tv is implementor;

  submethod BUILD ( :$adw-tool-view ) {
    self.setAdwToolbarView($adw-tool-view) if $adw-tool-view
  }

  method setAdwToolbarView (AdwToolbarViewAncestry $_) {
    my $to-parent;

    $!adw-tv = do {
      when AdwToolbarView {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwToolbarView, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwToolbarView
    is also<AdwToolbarView>
  { $!adw-tv }

  multi method new (
     $adw-tool-view where * ~~ AdwToolbarViewAncestry,

    :$ref                                               = True
  ) {
    return unless $adw-tool-view;

    my $o = self.bless( :$adw-tool-view );
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $adw-tool-view = adw_toolbar_view_new();

    $adw-tool-view ?? self.bless( :$adw-tool-view ) !! Nil;
  }

  # Type: int
  method bottom-bar-height is rw  is g-property is also<bottom_bar_height> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('bottom-bar-height', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn 'bottom-bar-height does not allow writing'
      }
    );
  }

  # Type: AdwToolbarStyle
  method bottom-bar-style ( :$enum = True )
    is rw
    is g-property
    is also<bottom_bar_style>
  {
    my $gv = GLib::Value.new( Adwaita::Enum::ToolbarStyle.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('bottom-bar-style', $gv);
        my $s = $gv.enum;
        return $s unless $enum;
        AdwToolbarStyleEnum($s);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwToolbarStyle) = $val;
        self.prop_set('bottom-bar-style', $gv);
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
  method extend-content-to-bottom-edge
    is rw
    is g-property
    is also<extend_content_to_bottom_edge>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('extend-content-to-bottom-edge', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('extend-content-to-bottom-edge', $gv);
      }
    );
  }

  # Type: boolean
  method extend-content-to-top-edge
    is rw
    is g-property
    is also<extend_content_to_top_edge>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('extend-content-to-top-edge', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('extend-content-to-top-edge', $gv);
      }
    );
  }

  # Type: boolean
  method reveal-bottom-bars is rw  is g-property is also<reveal_bottom_bars> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reveal-bottom-bars', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('reveal-bottom-bars', $gv);
      }
    );
  }

  # Type: boolean
  method reveal-top-bars is rw  is g-property is also<reveal_top_bars> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reveal-top-bars', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('reveal-top-bars', $gv);
      }
    );
  }

  # Type: int
  method top-bar-height is rw  is g-property is also<top_bar_height> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('top-bar-height', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn 'top-bar-height does not allow writing'
      }
    );
  }

  # Type: AdwToolbarStyle
  method top-bar-style  ( :$enum = True )
    is rw
    is g-property
    is also<top_bar_style>
  {
    my $gv = GLib::Value.new( Adwaita::Enum::ToolbarStyle.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('top-bar-style', $gv);
        my $s = $gv.enum;
        return $s unless $enum;
        AdwToolbarStyleEnum($s);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwToolbarStyle) = $val;
        self.prop_set('top-bar-style', $gv);
      }
    );
  }

  method add_bottom_bar (GtkWidget() $widget) is also<add-bottom-bar> {
    adw_toolbar_view_add_bottom_bar($!adw-tv, $widget);
  }

  method add_top_bar (GtkWidget() $widget) is also<add-top-bar> {
    adw_toolbar_view_add_top_bar($!adw-tv, $widget);
  }

  method get_bottom_bar_height is also<get-bottom-bar-height> {
    adw_toolbar_view_get_bottom_bar_height($!adw-tv);
  }

  method get_bottom_bar_style ( :$enum = True ) is also<get-bottom-bar-style> {
    my $s = adw_toolbar_view_get_bottom_bar_style($!adw-tv);
    return $s unless $enum;
    AdwToolbarStyleEnum($s);
  }

  method get_content (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-content>
  {
    returnProperWidget(
      adw_toolbar_view_get_content($!adw-tv),
      $raw,
      $slow
    );
  }

  method get_extend_content_to_bottom_edge
    is also<get-extend-content-to-bottom-edge>
  {
    so adw_toolbar_view_get_extend_content_to_bottom_edge($!adw-tv);
  }

  method get_extend_content_to_top_edge
    is also<get-extend-content-to-top-edge>
  {
    so adw_toolbar_view_get_extend_content_to_top_edge($!adw-tv);
  }

  method get_reveal_bottom_bars is also<get-reveal-bottom-bars> {
    so adw_toolbar_view_get_reveal_bottom_bars($!adw-tv);
  }

  method get_reveal_top_bars is also<get-reveal-top-bars> {
    so adw_toolbar_view_get_reveal_top_bars($!adw-tv);
  }

  method get_top_bar_height is also<get-top-bar-height> {
    adw_toolbar_view_get_top_bar_height($!adw-tv);
  }

  method get_top_bar_style ( :$enum = True ) is also<get-top-bar-style> {
    my $s = adw_toolbar_view_get_top_bar_style($!adw-tv);
    return $s unless $enum;
    AdwToolbarStyleEnum($s);
  }

  method remove (GtkWidget() $widget) {
    adw_toolbar_view_remove($!adw-tv, $widget);
  }

  method set_bottom_bar_style (Int() $style) is also<set-bottom-bar-style> {
    my AdwToolbarStyle $s = $style;

    adw_toolbar_view_set_bottom_bar_style($!adw-tv, $s);
  }

  method set_content (GtkWidget() $content) is also<set-content> {
    adw_toolbar_view_set_content($!adw-tv, $content);
  }

  method set_extend_content_to_bottom_edge (Int() $extend)
    is also<set-extend-content-to-bottom-edge>
  {
    my gboolean $e = $extend.so.Int;

    adw_toolbar_view_set_extend_content_to_bottom_edge($!adw-tv, $e);
  }

  method set_extend_content_to_top_edge (Int() $extend)
    is also<set-extend-content-to-top-edge>
  {
    my gboolean $e = $extend.so.Int;

    adw_toolbar_view_set_extend_content_to_top_edge($!adw-tv, $e);
  }

  method set_reveal_bottom_bars (Int() $reveal)
    is also<set-reveal-bottom-bars>
  {
    my gboolean $r = $reveal.so.Int;

    adw_toolbar_view_set_reveal_bottom_bars($!adw-tv, $r);
  }

  method set_reveal_top_bars (Int() $reveal) is also<set-reveal-top-bars> {
    my gboolean $r = $reveal.so.Int;

    adw_toolbar_view_set_reveal_top_bars($!adw-tv, $r);
  }

  method set_top_bar_style (Int() $style) is also<set-top-bar-style> {
    my AdwToolbarStyle $s = $style;

    adw_toolbar_view_set_top_bar_style($!adw-tv, $s);
  }

}
