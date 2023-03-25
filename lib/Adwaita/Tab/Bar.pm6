use v6.c;

use NativeCall;
use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Tab::Bar;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwTabBarAncestry is export of Mu
  where AdwTabBar | GtkWidgetAncestry;

class Adwaita::Tab::Bar is GTK::Widget:ver<4> {
  has AdwTabBar $!adw-tb is implementor;

  submethod BUILD ( :$adw-tab-bar ) {
    self.setAdwTabBar($adw-tab-bar) if $adw-tab-bar
  }

  method setAdwTabBar (AdwTabBarAncestry $_) {
    my $to-parent;

    $!adw-tb = do {
      when AdwTabBar {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwTabBar, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwTabBar
    is also<AdwTabBar>
  { $!adw-tb }

  multi method new (
    $adw-tab-bar where * ~~ AdwTabBarAncestry,

    :$ref = True
  ) {
    return unless $adw-tab-bar;

    my $o = self.bless( :$adw-tab-bar );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-tab-bar = adw_tab_bar_new();

    my $o = $adw-tab-bar ?? self.bless( :$adw-tab-bar ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method autohide is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('autohide', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('autohide', $gv);
      }
    );
  }

  # Type: AdwWidget
  method end-action-widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<end_action_widget>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('end-action-widget', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('end-action-widget', $gv);
      }
    );
  }

  # Type: boolean
  method expand-tabs is rw  is g-property is also<expand_tabs> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('expand-tabs', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('expand-tabs', $gv);
      }
    );
  }

  # Type: boolean
  method extra-drag-preload
    is rw
    is g-property
    is also<extra_drag_preload>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('extra-drag-preload', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('extra-drag-preload', $gv);
      }
    );
  }

  # Type: boolean
  method inverted is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('inverted', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('inverted', $gv);
      }
    );
  }

  # Type: boolean
  method is-overflowing is rw  is g-property is also<is_overflowing> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-overflowing', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'is-overflowing does not allow writing'
      }
    );
  }

  # Type: AdwWidget
  method start-action-widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<start_action_widget>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('start-action-widget', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('start-action-widget', $gv);
      }
    );
  }

  # Type: boolean
  method tabs-revealed is rw  is g-property is also<tabs_revealed> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('tabs-revealed', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'tabs-revealed does not allow writing'
      }
    );
  }

  # Type: AdwTabView
  method view ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( ::('Adwaita::Tab::View').get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('view', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |::('Adwaita::Tab::View'.getTypePair)
        )
      },
      STORE => -> $, AdwTabView() $val is copy {
        $gv.object = $val;
        self.prop_set('view', $gv);
      }
    );
  }

  method get_autohide is also<get-autohide> {
    so adw_tab_bar_get_autohide($!adw-tb);
  }

  method get_end_action_widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-end-action-widget>
  {
    returnProperWidget(
      adw_tab_bar_get_end_action_widget($!adw-tb),
      $raw,
      $proper
    );
  }

  method get_expand_tabs is also<get-expand-tabs> {
    so adw_tab_bar_get_expand_tabs($!adw-tb);
  }

  method get_extra_drag_preload is also<get-extra-drag-preload> {
    adw_tab_bar_get_extra_drag_preload($!adw-tb);
  }

  method get_inverted is also<get-inverted> {
    so adw_tab_bar_get_inverted($!adw-tb);
  }

  method get_is_overflowing is also<get-is-overflowing> {
    so adw_tab_bar_get_is_overflowing($!adw-tb);
  }

  method get_start_action_widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-start-action-widget>
  {
    returnProperWidget(
      adw_tab_bar_get_start_action_widget($!adw-tb),
      $raw,
      $proper
    );
  }

  method get_tabs_revealed is also<get-tabs-revealed> {
    so adw_tab_bar_get_tabs_revealed($!adw-tb);
  }

  method get_view ( :$raw = False ) is also<get-view> {
    propReturnObject(
      adw_tab_bar_get_view($!adw-tb),
      $raw,
      |::('Adwaita::Tab::View').getTypePair
    )
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_tab_bar_get_type, $n, $t );
  }

  method set_autohide (Int() $autohide) is also<set-autohide> {
    my gboolean $a = $autohide.so.Int;

    adw_tab_bar_set_autohide($!adw-tb, $a);
  }

  method set_end_action_widget (GtkWidget() $widget)
    is also<set-end-action-widget>
  {
    adw_tab_bar_set_end_action_widget($!adw-tb, $widget);
  }

  method set_expand_tabs (Int() $expand_tabs) is also<set-expand-tabs> {
    my gboolean $e = $expand_tabs.so.Int;

    adw_tab_bar_set_expand_tabs($!adw-tb, $e);
  }

  method set_extra_drag_preload (Int() $preload)
    is also<set-extra-drag-preload>
  {
    my gboolean $p = $preload.so.Int;

    adw_tab_bar_set_extra_drag_preload($!adw-tb, $p);
  }

  method set_inverted (Int() $inverted) is also<set-inverted> {
    my gboolean $i = $inverted.so.Int;

    adw_tab_bar_set_inverted($!adw-tb, $i);
  }

  method set_start_action_widget (GtkWidget() $widget)
    is also<set-start-action-widget>
  {
    adw_tab_bar_set_start_action_widget($!adw-tb, $widget);
  }

  method set_view (AdwTabView() $view) is also<set-view> {
    adw_tab_bar_set_view($!adw-tb, $view);
  }

  proto method setup_extra_drop_target (|)
    is also<setup-extra-drop-target>
  { * }

  multi method setup_extra_drop_target (Int() $actions, @types) {
    samewith( $actions, ArrayToCArray(GType, @types), @types.elems )
  }
  multi method setup_extra_drop_target (
    Int()         $actions,
    CArray[GType] $types,
    Int()         $n_types
  ) {
    my GdkDragAction $a = $actions;
    my gsize         $n = $n_types;

    adw_tab_bar_setup_extra_drop_target($!adw-tb, $a, $types, $n);
  }

}
