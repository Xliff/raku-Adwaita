use v6.c;

use NativeCall;
use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Tab::Overview;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;
use Adwaita::Roles::Signals::Tab::Overview;

class Adwaita::Tab::Overview is GTK::Widget:ver<4> {
  also does Adwaita::Roles::Signals::Tab::Overview;

  has AdwTabOverview $!adw-to;

  method new ( *%a ) {
    my $adw-tab-overview = adw_tab_overview_new();

    my $o = $adw-tab-overview ?? self.bless( :$adw-tab-overview ) !! Nil;
    $o.setAttributes(%a);
    $o;
  }

  # Type: GtkWidget
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
  method enable-new-tab is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-new-tab', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-new-tab', $gv);
      }
    );
  }

  # Type: boolean
  method enable-search is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-search', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-search', $gv);
      }
    );
  }

  # Type: boolean
  method extra-drag-preload is rw  is g-property {
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

  # Type: AdwTabGrid
  #
  # cw: Not found in public API, so not enabling...
  #
  # method grid is rw  is g-property {
  #   my $gv = GLib::Value.new( AdwTabGrid );
  #   Proxy.new(
  #     FETCH => sub ($) {
  #       self.prop_get('grid', $gv);
  #       $gv.AdwTabGrid;
  #     },
  #     STORE => -> $,  $val is copy {
  #       $gv.AdwTabGrid = $val;
  #       self.prop_set('grid', $gv);
  #     }
  #   );
  # }

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

  # Type: AdwWidget
  method new-button (
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
        self.prop_get('new-button', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('new-button', $gv);
      }
    );
  }

  # Type: boolean
  method open is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('open', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('open', $gv);
      }
    );
  }

  # Type: AdwWidget
  method overview (
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
        self.prop_get('overview', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        )
      },
      STORE => -> $, GtkWidget $val is copy {
        $gv.object = $val;
        self.prop_set('overview', $gv);
      }
    );
  }

  # Type: AdwTabGrid
  #
  # cw: There is no public type for AdwTabGrid, so not enabling
  #     this, for the moment.
  # method pinned-grid is rw  is g-property {
  #   my $gv = GLib::Value.new( AdwTabGrid );
  #   Proxy.new(
  #     FETCH => sub ($) {
  #       self.prop_get('pinned-grid', $gv);
  #       $gv.AdwTabGrid;
  #     },
  #     STORE => -> $,  $val is copy {
  #       $gv.AdwTabGrid = $val;
  #       self.prop_set('pinned-grid', $gv);
  #     }
  #   );
  # }

  # Type: boolean
  method search-active is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('search-active', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'search-active does not allow writing'
      }
    );
  }

  # Type: GMenuModel
  method secondary-menu ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GIO::MenuModel.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('secondary-menu', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GIO::MenuModel.getTypePair
        );
      },
      STORE => -> $, GMenuModel() $val is copy {
        $gv.object = $val;
        self.prop_set('secondary-menu', $gv);
      }
    );
  }

  # Type: boolean
  method show-end-title-buttons is rw  is g-property {
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
  method show-start-title-buttons is rw  is g-property {
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

  # Type: AdwTabView
  method view ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Adwaita::Tab::View.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('view', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Tab::View.getTypePair
        );
      },
      STORE => -> $, AdwTabView() $val is copy {
        $gv.object = $val;
        self.prop_set('view', $gv);
      }
    );
  }

  method Create-Tab {
    self.connect($!adw-to, 'create-tab');
  }

  method Extra-Drag-Drop {
    self.connect-page-value($!adw-to, 'extra-drag-drop');
  }

  method Extra-Drag-Value {
    self.connect-page-value($!adw-to, 'extra-drag-value');
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  ) {
    returnProperWidget(
      adw_tab_overview_get_child($!adw-to),
      $raw,
      $proper
    );
  }

  method get_enable_new_tab {
    so adw_tab_overview_get_enable_new_tab($!adw-to);
  }

  method get_enable_search {
    so adw_tab_overview_get_enable_search($!adw-to);
  }

  method get_extra_drag_preload {
    so adw_tab_overview_get_extra_drag_preload($!adw-to);
  }

  method get_inverted {
    so adw_tab_overview_get_inverted($!adw-to);
  }

  method get_open {
    so adw_tab_overview_get_open($!adw-to);
  }

  method get_search_active {
    so adw_tab_overview_get_search_active($!adw-to);
  }

  method get_secondary_menu ( :$raw = False ) {
    propReturnObject(
      adw_tab_overview_get_secondary_menu($!adw-to),
      $raw,
      |GIO::MenuModel.getTypePair
    );
  }

  method get_show_end_title_buttons {
    so adw_tab_overview_get_show_end_title_buttons($!adw-to);
  }

  method get_show_start_title_buttons {
    so adw_tab_overview_get_show_start_title_buttons($!adw-to);
  }

  method get_view ( :$raw = False ) {
    propReturnObject(
      adw_tab_overview_get_view($!adw-to),
      $raw
      |Adwaita::Tab::View.getTypePair
    );
  }

  method set_child (GtkWidget() $child) {
    adw_tab_overview_set_child($!adw-to, $child);
  }

  method set_enable_new_tab (Int() $enable_new_tab) {
    my gboolean $e = $enable_new_tab.so.Int;

    adw_tab_overview_set_enable_new_tab($!adw-to, $e);
  }

  method set_enable_search (Int() $enable_search) {
    my gboolean $e = $enable_search.so.Int;

    adw_tab_overview_set_enable_search($!adw-to, $e);
  }

  method set_extra_drag_preload (Int() $preload) {
    my gboolean $p = $preload.so.Int;

    adw_tab_overview_set_extra_drag_preload($!adw-to, $p);
  }

  method set_inverted (Int() $inverted) {
    my gboolean $i = $inverted.so.Int;

    adw_tab_overview_set_inverted($!adw-to, $i);
  }

  method set_open (Int() $open) {
    my gboolean $o = $open.so.Int;

    adw_tab_overview_set_open($!adw-to, $o);
  }

  method set_secondary_menu (GMenuModel() $secondary_menu) {
    adw_tab_overview_set_secondary_menu($!adw-to, $secondary_menu);
  }

  method set_show_end_title_buttons (Int() $show_end_title_buttons) {
    my gboolean $s = $show_end_title_buttons.so.Int;

    adw_tab_overview_set_show_end_title_buttons($!adw-to, $s);
  }

  method set_show_start_title_buttons (Int() $show_start_title_buttons) {
    my gboolean $s = $show_start_title_buttons.so.Int;

    adw_tab_overview_set_show_start_title_buttons($!adw-to, $s);
  }

  method set_view (AdwTabView() $view) {
    adw_tab_overview_set_view($!adw-to, $view);
  }

  proto method setup_extra_drop_target (|)
  { * }

  multi method setup_extra_drop_target (Int() $actions, @types) {
    samewith(
      $actions,
      ArrayToCArray(GType, @types),
      @types.elems
    );
  }
  multi method setup_extra_drop_target (
    Int()          $actions,
    CArray[GType]  $types,
    Int()          $n_types
  ) {
    my GdkDragAction $a = $actions;
    my gsize         $n = $n_types;

    adw_tab_overview_setup_extra_drop_target($!adw-to, $a, $types, $n);
  }

}
