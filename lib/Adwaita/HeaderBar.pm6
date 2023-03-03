use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::HeaderBar;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;


our subset AdwHeaderBarAncestry is export of Mu
  where AdwHeaderBar | GtkWidgetAncestry;

class Adwaita::HeaderBar is GTK::Widget:ver<4> {
  has AdwHeaderBar $!adw-hb is implementor;

  submethod BUILD ( :$adw-header-bar ) {
    self.setAdwHeaderBar($adw-header-bar) if $adw-header-bar
  }

  method setAdwHeaderBar (AdwHeaderBarAncestry $_) {
    my $to-parent;

    $!adw-hb = do {
      when AdwHeaderBar {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwHeaderBar, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwHeaderBar
    is also<AdwHeaderBar>
  { $!adw-hb }

  multi method new (
    $adw-header-bar where * ~~ AdwHeaderBarAncestry,

    :$ref = True
  ) {
    return unless $adw-header-bar;

    my $o = self.bless( :$adw-header-bar );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-header-bar = adw_header_bar_new();

    my $o = $adw-header-bar ?? self.bless( :$adw-header-bar ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: AdwCenteringPolicy
  method centering-policy ( :$enum = True )
    is rw
    is g-property
    is also<centering_policy>
  {
    my $gv = GLib::Value.new-enum( AdwCenteringPolicy );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('centering-policy', $gv);
        my $c = $gv.enum;
        return $c unless $enum;
        AdwCenteringPolicyEnum($c);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwCenteringPolicy) = $val;
        self.prop_set('centering-policy', $gv);
      }
    );
  }

  # Type: string
  method decoration-layout
    is rw
    is g-property
    is also<decoration_layout>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('decoration-layout', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('decoration-layout', $gv);
      }
    );
  }

  # Type: boolean
  method show-end-title-buttons
    is rw
    is g-property
    is also<show_end_title_buttons>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-end-title-buttons', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-end-title-buttons', $gv);
      }
    );
  }

  # Type: boolean
  method show-start-title-buttons
    is rw
    is g-property
    is also<show_start_title_buttons>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-start-title-buttons', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-start-title-buttons', $gv);
      }
    );
  }

  # Type: AdwWidget
  method title-widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<title_widget>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title-widget', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('title-widget', $gv);
      }
    );
  }

  method get_centering_policy ( :$enum = True )
    is also<get-centering-policy>
  {
    my $c = adw_header_bar_get_centering_policy($!adw-hb);
    return $c unless $enum;
    AdwCenteringPolicyEnum($c);
  }

  method get_decoration_layout is also<get-decoration-layout> {
    adw_header_bar_get_decoration_layout($!adw-hb);
  }

  method get_show_end_title_buttons is also<get-show-end-title-buttons> {
    so adw_header_bar_get_show_end_title_buttons($!adw-hb);
  }

  method get_show_start_title_buttons
    is also<get-show-start-title-buttons>
  {
    so adw_header_bar_get_show_start_title_buttons($!adw-hb);
  }

  method get_title_widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-title-widget>
  {
    returnProperWidget(
      adw_header_bar_get_title_widget($!adw-hb),
      $raw,
      $proper
    );
  }

  method pack_end (GtkWidget() $child)
    is also<
      pack-end
      append
      add_child
      add-child
    >
  {
    #self.appendBuildableChild($child);
    adw_header_bar_pack_end($!adw-hb, $child);
  }

  method pack_start (GtkWidget() $child)
    is also<
      pack-start
      prepend
    >
  {
    #self.prependBuildableChild($child);
    adw_header_bar_pack_start($!adw-hb, $child);
  }

  method remove (GtkWidget() $child) {
    #self.removeBuildableChild($child)
    adw_header_bar_remove($!adw-hb, $child);
  }

  method set_centering_policy (Int() $centering_policy)
    is also<set-centering-policy>
  {
    my AdwCenteringPolicy $c = $centering_policy;

    adw_header_bar_set_centering_policy($!adw-hb, $c);
  }

  method set_decoration_layout (Str() $layout)
    is also<set-decoration-layout>
  {
    adw_header_bar_set_decoration_layout($!adw-hb, $layout);
  }

  method set_show_end_title_buttons (Int() $setting)
    is also<set-show-end-title-buttons>
  {
    my gboolean $s = $setting.so.Int;

    adw_header_bar_set_show_end_title_buttons($!adw-hb, $s);
  }

  method set_show_start_title_buttons (Int() $setting)
    is also<set-show-start-title-buttons>
  {
    my gboolean $s = $setting.so.Int;

    adw_header_bar_set_show_start_title_buttons($!adw-hb, $s);
  }

  method set_title_widget (GtkWidget() $title_widget)
    is also<set-title-widget>
  {
    adw_header_bar_set_title_widget($!adw-hb, $title_widget);
  }

}
