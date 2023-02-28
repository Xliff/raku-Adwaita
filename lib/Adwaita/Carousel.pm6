use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Carousel;

use GTK::Widget:ver<4>;
use Adwaita::SpringParams;

use GLib::Roles::Implementor;

our subset AdwCarouselAncestry is export of Mu
  where AdwCarousel | GtkWidgetAncestry;

class Adwaita::Carousel is GTK::Widget:ver<4> {
  has AdwCarousel $!adw-c is implementor;

  submethod BUILD ( :$adw-carousel ) {
    self.setAdwCarousel($adw-carousel) if $adw-carousel
  }

  method setAdwCarousel (AdwCarouselAncestry $_) {
    my $to-parent;

    $!adw-c = do {
      when AdwCarousel {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwCarousel, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwCarousel
    is also<AdwCarousel>
  { $!adw-c }

  multi method new (
    $adw-carousel where * ~~ AdwCarouselAncestry,

    :$ref = True
  ) {
    return unless $adw-carousel;

    my $o = self.bless( :$adw-carousel );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adwaita-carousel = adw_carousel_new();

    $adwaita-carousel.^name.say;

    my $o = $adwaita-carousel ?? self.bless( :$adwaita-carousel ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
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
  method allow-scroll-wheel is rw  is g-property is also<allow_scroll_wheel> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allow-scroll-wheel', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-scroll-wheel', $gv);
      }
    );
  }

  # Type: boolean
  method interactive is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('interactive', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('interactive', $gv);
      }
    );
  }

  # Type: uint
  method n-pages is rw  is g-property is also<n_pages> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-pages', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        warn 'n-pages does not allow writing'
      }
    );
  }

  # Type: double
  method position is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('position', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        warn 'position does not allow writing'
      }
    );
  }

  # Type: uint
  method reveal-duration is rw  is g-property is also<reveal_duration> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reveal-duration', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('reveal-duration', $gv);
      }
    );
  }

  # Type: AdwSpringParams
  method scroll-params (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<scroll_params>
  {
    my $gv = GLib::Value.new( Adwaita::SpringParams.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('scroll-params', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, AdwSpringParams() $val is copy {
        $gv.object = $val;
        self.prop_set('scroll-params', $gv);
      }
    );
  }

  # Type: uint
  method spacing is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('spacing', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('spacing', $gv);
      }
    );
  }

  method Page-Changed is also<Page_Changed> {
    self.connect-uint($!adw-c, 'page-changed');
  }

  method append (GtkWidget() $child) {
    #self.addBuildableChild($child);
    adw_carousel_append($!adw-c, $child);
  }

  method get_allow_long_swipes is also<get-allow-long-swipes> {
    so adw_carousel_get_allow_long_swipes($!adw-c);
  }

  method get_allow_mouse_drag is also<get-allow-mouse-drag> {
    so adw_carousel_get_allow_mouse_drag($!adw-c);
  }

  method get_allow_scroll_wheel is also<get-allow-scroll-wheel> {
    so adw_carousel_get_allow_scroll_wheel($!adw-c);
  }

  method get_interactive is also<get-interactive> {
    so adw_carousel_get_interactive($!adw-c);
  }

  method get_n_pages is also<get-n-pages> {
    adw_carousel_get_n_pages($!adw-c);
  }

  method get_nth_page (
    Int()  $n
          :$raw           = False,
          :quick(:$fast)  = False,
          :slow(:$proper) = $fast.not,
  )
    is also<get-nth-page>
  {
    my guint $nn = $n;

    returnProperWidget(
      adw_carousel_get_nth_page($!adw-c, $n),
      $raw,
      $proper
    );
  }

  method get_position is also<get-position> {
    adw_carousel_get_position($!adw-c);
  }

  method get_reveal_duration is also<get-reveal-duration> {
    adw_carousel_get_reveal_duration($!adw-c);
  }

  method get_scroll_params ( :$raw = False ) is also<get-scroll-params> {
    propReturnObject(
      adw_carousel_get_scroll_params($!adw-c),
      $raw,
      |Adwaita::SpringParams.getTypePair
    );
  }

  method get_spacing is also<get-spacing> {
    adw_carousel_get_spacing($!adw-c);
  }

  method insert (GtkWidget() $child, Int() $position) {
    my guint $p = $position;

    #self.insertBuildableChild(1, $child);
    adw_carousel_insert($!adw-c, $child, $position);
  }

  method prepend (GtkWidget() $child) {
    #self.prependBuildableChild($child);
    adw_carousel_prepend($!adw-c, $child);
  }

  method remove (GtkWidget() $child) {
    #self.removeBuildableChild($child);
    adw_carousel_remove($!adw-c, $child);
  }

  method reorder (GtkWidget() $child, Int() $position) {
    my guint $p = $position;

    #self.reorderBuildableChild($p, $child);
    adw_carousel_reorder($!adw-c, $child, $position);
  }

  method scroll_to (GtkWidget() $widget, Int() $animate) is also<scroll-to> {
    my gboolean $a = $animate;

    adw_carousel_scroll_to($!adw-c, $widget, $a);
  }

  method set_allow_long_swipes (Int() $allow_long_swipes)
    is also<set-allow-long-swipes>
  {
    my gboolean $a = $allow_long_swipes.so.Int;

    adw_carousel_set_allow_long_swipes($!adw-c, $a);
  }

  method set_allow_mouse_drag (Int() $allow_mouse_drag)
    is also<set-allow-mouse-drag>
  {
    my gboolean $a = $allow_mouse_drag.so.Int;

    adw_carousel_set_allow_mouse_drag($!adw-c, $a);
  }

  method set_allow_scroll_wheel (Int() $allow_scroll_wheel)
    is also<set-allow-scroll-wheel>
  {
    my gboolean $a = $allow_scroll_wheel.so.Int;

    adw_carousel_set_allow_scroll_wheel($!adw-c, $a);
  }

  method set_interactive (Int() $interactive) is also<set-interactive> {
    my gboolean $i = $interactive.so.Int;

    adw_carousel_set_interactive($!adw-c, $i);
  }

  method set_reveal_duration (Int() $reveal_duration)
    is also<set-reveal-duration>
  {
    my guint $r = $reveal_duration;

    adw_carousel_set_reveal_duration($!adw-c, $r);
  }

  method set_scroll_params (AdwSpringParams() $params)
    is also<set-scroll-params>
  {
    adw_carousel_set_scroll_params($!adw-c, $params);
  }

  method set_spacing (Int() $spacing) is also<set-spacing> {
    my guint $s = $spacing;

    adw_carousel_set_spacing($!adw-c, $s);
  }

}
