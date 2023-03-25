use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Tab::View;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;
use Adwaita::Roles::Signals::Tab::View;

our subset AdwTabViewAncestry is export of Mu
  where AdwTabView | GtkWidgetAncestry;

class Adwaita::Tab::View is GTK::Widget:ver<4> {
  also does Adwaita::Roles::Signals::Tab::View;

  has AdwTabView $!adw-tv is implementor;

  submethod BUILD ( :$adw-tab-view ) {
    self.setAdwTabPage($adw-tab-view) if $adw-tab-view
  }

  method setAdwTabView (AdwTabViewAncestry $_) {
    my $to-parent;

    $!adw-tv = do {
      when AdwTabView {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwTabView, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwTabView
    is also<AdwTabView>
  { $!adw-tv }

  multi method new (
    $adw-tab-view where * ~~ AdwTabViewAncestry,

    :$ref = True
  ) {
    return unless $adw-tab-view;

    my $o = self.bless( :$adw-tab-view );
    $o.ref if $ref;
    $o;
  }
  multi method new (*%a ) {
    my $adw-tab-view = adw_tab_view_new();

    my $o = $adw-tab-view ?? self.bless( :$adw-tab-view ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: GIcon
  method default-icon (:$raw = False )
    is rw
    is g-property
    is also<default_icon>
  {
    my $gv = GLib::Value.new( GIO::Icon.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-icon', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GIO::Icon.getTypePair
        );
      },
      STORE => -> $, GIcon() $val is copy {
        $gv.object = $val;
        self.prop_set('default-icon', $gv);
      }
    );
  }

  # Type: boolean
  method is-transferring-page
    is rw
    is g-property
    is also<is_transferring_page>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-transferring-page', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'is-transferring-page does not allow writing'
      }
    );
  }

  # Type: GMenuModel
  method menu-model ( :$raw = False )
    is rw
    is g-property
    is also<menu_model>
  {
    my $gv = GLib::Value.new( GIO::MenuModel.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('menu-model', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GIO::MenuModel.getTypePair
        );
      },
      STORE => -> $, GMenuModel() $val is copy {
        $gv.object = $val;
        self.prop_set('menu-model', $gv);
      }
    );
  }

  # Type: int
  method n-pages is rw  is g-property is also<n_pages> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-pages', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn 'n-pages does not allow writing'
      }
    );
  }

  # Type: int
  method n-pinned-pages
    is rw
    is g-property
    is also<n_pinned_pages>
  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('n-pinned-pages', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn 'n-pinned-pages does not allow writing'
      }
    );
  }

  # Type: GtkSelectionModel
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

  # Type: AdwTabPage
  method selected-page ( :$raw = False )
    is rw
    is g-property
    is also<selected_page>
  {
    my $gv = GLib::Value.new( ::('Adwaita::Tab::Page').get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selected-page', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |::('Adwaita::Tab::Page').getTypePair
        );
      },
      STORE => -> $, AdwTabPage() $val is copy {
        $gv.object = $val;
        self.prop_set('selected-page', $gv);
      }
    );
  }

  # Type: AdwTabViewShortcuts
  method shortcuts is rw  is g-property {
    my $gv = GLib::Value.new( AdwTabViewShortcuts );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('shortcuts', $gv);
        $gv.AdwTabViewShortcuts;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwTabViewShortcuts = $val;
        self.prop_set('shortcuts', $gv);
      }
    );
  }

  method Close-Page {
    self.connect-tab-page($!adw-tv, 'close-page');
  }

  method Create-Window {
    self.connect($!adw-tv, 'create-window');
  }

  method Indicator-Activated {
    self.connect-tab-page($!adw-tv, 'indicator-activated');
  }

  method Page-Attached {
    self.connect-page-action($!adw-tv, 'page-attached');
  }

  method Page-Detached {
    self.connect-page-action($!adw-tv, 'page-detached');
  }

  method Page-Reordered {
    self.connect-page-action($!adw-tv, 'page-reordered');
  }

  method Setup-Menu {
    self.connect-page($!adw-tv, 'setup-menu');
  }

  method add_page (GtkWidget() $child, AdwTabPage() $parent)
    is also<add-page>
  {
    #self.addBuildableChild($child);
    adw_tab_view_add_page($!adw-tv, $child, $parent);
  }

  method add_shortcuts (AdwTabViewShortcuts $shortcuts)
    is also<add-shortcuts>
  {
    adw_tab_view_add_shortcuts($!adw-tv, $shortcuts);
  }

  method append (GtkWidget() $child)
    is also<
      add-child
      add_child
    >
  {
    #self.addBuildableChild($child);
    adw_tab_view_append($!adw-tv, $child);
  }

  method append_pinned (GtkWidget() $child) is also<append-pinned> {
    #self.addBuildableChild($child);
    adw_tab_view_append_pinned($!adw-tv, $child);
  }

  method close_other_pages (AdwTabPage() $page)
    is also<close-other-pages>
  {
    adw_tab_view_close_other_pages($!adw-tv, $page);
  }

  method close_page (AdwTabPage() $page) is also<close-page> {
    adw_tab_view_close_page($!adw-tv, $page);
  }

  method close_page_finish (AdwTabPage() $page, Int() $confirm)
    is also<close-page-finish>
  {
    my gboolean $c = $confirm.so.Int;

    adw_tab_view_close_page_finish($!adw-tv, $page, $c);
  }

  method close_pages_after (AdwTabPage() $page) is also<close-pages-after> {
    adw_tab_view_close_pages_after($!adw-tv, $page);
  }

  method close_pages_before (AdwTabPage() $page)
    is also<close-pages-before>
  {
    adw_tab_view_close_pages_before($!adw-tv, $page);
  }

  method get_default_icon ( :$raw = False ) is also<get-default-icon> {
    propReturnObject(
      adw_tab_view_get_default_icon($!adw-tv),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_is_transferring_page is also<get-is-transferring-page> {
    so adw_tab_view_get_is_transferring_page($!adw-tv);
  }

  method get_menu_model ( :$raw = False ) is also<get-menu-model> {
    propReturnObject(
      adw_tab_view_get_menu_model($!adw-tv),
      $raw,
      |GIO::MenuModel.getTypePair
    );
  }

  method get_n_pages is also<get-n-pages> {
    adw_tab_view_get_n_pages($!adw-tv);
  }

  method get_n_pinned_pages is also<get-n-pinned-pages> {
    adw_tab_view_get_n_pinned_pages($!adw-tv);
  }

  method get_nth_page (Int() $position, :$raw = False)
    is also<get-nth-page>
  {
    my gint $p = $position;

    propReturnObject(
      adw_tab_view_get_nth_page($!adw-tv, $p),
      $raw,
      |::('Adwaita::Tab::Page').getTypePair
    );
  }

  method get_page (GtkWidget() $child, :$raw = False)
    is also<get-page>
  {
    propReturnObject(
      adw_tab_view_get_page($!adw-tv, $child),
      $raw,
      |::('Adwaita::Tab::Page').getTypePair
    );
  }

  method get_page_position (AdwTabPage() $page)
    is also<get-page-position>
  {
    adw_tab_view_get_page_position($!adw-tv, $page);
  }

  method get_pages ( :$raw = False ) is also<get-pages> {
    propReturnObject(
      adw_tab_view_get_pages($!adw-tv),
      $raw,
      |GTK::SelectionModel.getTypePair
    );
  }

  method get_selected_page ( :$raw = False )
    is also<get-selected-page>
  {
    propReturnObject(
      adw_tab_view_get_selected_page($!adw-tv),
      $raw,
      |::('Adwaita::Tab::Page').getTypePair
    );
  }

  method get_shortcuts is also<get-shortcuts> {
    adw_tab_view_get_shortcuts($!adw-tv);
  }

  method insert (GtkWidget() $child, Int() $position) {
    my gint $p = $position;

    #self.insertBuildableChild($child, $position);
    adw_tab_view_insert($!adw-tv, $child, $p);
  }

  method insert_pinned (GtkWidget() $child, Int() $position)
    is also<insert-pinned>
  {
    my gint $p = $position;

    #self.insertBuildableChild($child, $position);
    adw_tab_view_insert_pinned($!adw-tv, $child, $p);
  }

  method invalidate_thumbnails is also<invalidate-thumbnails> {
    adw_tab_view_invalidate_thumbnails($!adw-tv);
  }

  method prepend (GtkWidget() $child) {
    #self.prependBuildableChild($child);
    adw_tab_view_prepend($!adw-tv, $child);
  }

  method prepend_pinned (GtkWidget()  $child)
    is also<prepend-pinned>
  {
    #self.prependBuildableChild($child);
    adw_tab_view_prepend_pinned($!adw-tv, $child);
  }

  method remove_shortcuts (AdwTabViewShortcuts() $shortcuts)
    is also<remove-shortcuts>
  {
    adw_tab_view_remove_shortcuts($!adw-tv, $shortcuts);
  }

  method reorder_backward (AdwTabPage() $page) is also<reorder-backward> {
    #self.reorderBuildableChild($page, relative => -1);
    adw_tab_view_reorder_backward($!adw-tv, $page);
  }

  method reorder_first (AdwTabPage() $page) is also<reorder-first> {
    #self.reorderBuildableChild($page, 0);
    adw_tab_view_reorder_first($!adw-tv, $page);
  }

  method reorder_forward (AdwTabPage() $page) is also<reorder-forward> {
    #self.reorderBuildableChild($page, relative => 1);
    adw_tab_view_reorder_forward($!adw-tv, $page);
  }

  method reorder_last (AdwTabPage() $page) is also<reorder-last> {
    #self.reorderBuildableChild($page, :last);
    adw_tab_view_reorder_last($!adw-tv, $page);
  }

  method reorder_page (AdwTabPage() $page, Int() $position)
    is also<reorder-page>
  {
    my gint $p = $position;

    #self.reorderBuildableChild($page, $position);
    adw_tab_view_reorder_page($!adw-tv, $page, $position);
  }

  method select_next_page is also<select-next-page> {
    so adw_tab_view_select_next_page($!adw-tv);
  }

  method select_previous_page is also<select-previous-page> {
    so adw_tab_view_select_previous_page($!adw-tv);
  }

  method set_default_icon (GIcon() $default_icon)
    is also<set-default-icon>
  {
    adw_tab_view_set_default_icon($!adw-tv, $default_icon);
  }

  method set_menu_model (GMenuModel() $menu_model)
    is also<set-menu-model>
  {
    adw_tab_view_set_menu_model($!adw-tv, $menu_model);
  }

  method set_page_pinned (AdwTabPage() $page, Int() $pinned)
    is also<set-page-pinned>
  {
    my gboolean $p = $pinned.so.Int;

    adw_tab_view_set_page_pinned($!adw-tv, $page, $p);
  }

  method set_selected_page (AdwTabPage() $selected_page)
    is also<set-selected-page>
  {
    adw_tab_view_set_selected_page($!adw-tv, $selected_page);
  }

  method set_shortcuts (AdwTabViewShortcuts() $shortcuts)
    is also<set-shortcuts>
  {
    adw_tab_view_set_shortcuts($!adw-tv, $shortcuts);
  }

  method transfer_page (
    AdwTabPage() $page,
    AdwTabView() $other_view,
    Int()        $position
  )
    is also<transfer-page>
  {
    my gint $p = $position;

    #self.removeBuildableChild($page);
    adw_tab_view_transfer_page($!adw-tv, $page, $other_view, $p);
    #$other_view.insertBuildableChild($page, $position);
  }

}


our subset AdwTabPageAncestry is export of Mu
  where AdwTabPage | GtkWidgetAncestry;

class Adwaita::Tab::Page is GTK::Widget:ver<4> {
  has AdwTabPage $!adw-tp is implementor;

  submethod BUILD ( :$adw-tab-view ) {
    self.setAdwTabPage($adw-tab-view) if $adw-tab-view
  }

  method setAdwTabPage (AdwTabPageAncestry $_) {
    my $to-parent;

    $!adw-tp = do {
      when AdwTabPage {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwTabPage, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwTabPage
    is also<AdwTabPage>
  { $!adw-tp }

  multi method new (
    $adw-tab-view where * ~~ AdwTabPageAncestry,

    :$ref = True
  ) {
    return unless $adw-tab-view;

    my $o = self.bless( :$adw-tab-view );
    $o.ref if $ref;
    $o;
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
    my $gv = GLib::Value.new( GTK::Widget.get-type );
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

  # Type: AdwIcon
  method icon ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GIO::Icon.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('icon', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GIO::Icon.getTypePair
        )
      },
      STORE => -> $, GIcon() $val is copy {
        $gv.object = $val;
        self.prop_set('icon', $gv);
      }
    );
  }

  # Type: boolean
  method indicator-activatable
    is rw
    is g-property
    is also<indicator_activatable>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('indicator-activatable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('indicator-activatable', $gv);
      }
    );
  }

  # Type: GIcon
  method indicator-icon ( :$raw = False )
    is rw
    is g-property
    is also<indicator_icon>
  {
    my $gv = GLib::Value.new( GIO::Icon.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('indicator-icon', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GIO::Icon.getTypePair
        );
      },
      STORE => -> $, GIcon() $val is copy {
        $gv.object = $val;
        self.prop_set('indicator-icon', $gv);
      }
    );
  }

  # Type: string
  method indicator-tooltip
    is rw
    is g-property
    is also<indicator_tooltip>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('indicator-tooltip', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('indicator-tooltip', $gv);
      }
    );
  }

  # Type: string
  method keyword is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('keyword', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('keyword', $gv);
      }
    );
  }

  # Type: boolean
  method live-thumbnail is rw  is g-property is also<live_thumbnail> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('live-thumbnail', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('live-thumbnail', $gv);
      }
    );
  }

  # Type: boolean
  method loading is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('loading', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('loading', $gv);
      }
    );
  }

  # Type: boolean
  method needs-attention is rw  is g-property is also<needs_attention> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('needs-attention', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('needs-attention', $gv);
      }
    );
  }

  # Type: AdwTabPage
  method parent ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( self.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('parent', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |self.getTypePair
        );
      },
      STORE => -> $, AdwTabPage() $val is copy {
        $gv.object = $val;
        self.prop_set('parent', $gv);
      }
    );
  }

  # Type: boolean
  method pinned is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pinned', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'pinned does not allow writing'
      }
    );
  }

  # Type: boolean
  method selected is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selected', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'selected does not allow writing'
      }
    );
  }

  # Type: float
  method thumbnail-xalign is rw  is g-property is also<thumbnail_xalign> {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('thumbnail-xalign', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('thumbnail-xalign', $gv);
      }
    );
  }

  # Type: float
  method thumbnail-yalign
    is rw
    is g-property
    is also<thumbnail_yalign>
  {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('thumbnail-yalign', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('thumbnail-yalign', $gv);
      }
    );
  }

  # Type: string
  method title is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('title', $gv);
      }
    );
  }

  # Type: string
  method tooltip is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('tooltip', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('tooltip', $gv);
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
      adw_tab_page_get_child($!adw-tp),
      $raw,
      $proper
    );
  }

  method get_icon ( :$raw = False ) is also<get-icon> {
    propReturnObject(
      adw_tab_page_get_icon($!adw-tp),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_indicator_activatable is also<get-indicator-activatable> {
    so adw_tab_page_get_indicator_activatable($!adw-tp);
  }

  method get_indicator_icon ( :$raw = False )
    is also<get-indicator-icon>
  {
    propReturnObject(
      adw_tab_page_get_indicator_icon($!adw-tp),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_indicator_tooltip is also<get-indicator-tooltip> {
    adw_tab_page_get_indicator_tooltip($!adw-tp);
  }

  method get_keyword is also<get-keyword> {
    adw_tab_page_get_keyword($!adw-tp);
  }

  method get_live_thumbnail is also<get-live-thumbnail> {
    adw_tab_page_get_live_thumbnail($!adw-tp);
  }

  method get_loading is also<get-loading> {
    so adw_tab_page_get_loading($!adw-tp);
  }

  method get_needs_attention is also<get-needs-attention> {
    so adw_tab_page_get_needs_attention($!adw-tp);
  }

  method get_parent (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-parent>
  {
    propReturnObject(
      adw_tab_page_get_parent($!adw-tp),
      $raw,
      $proper
    );
  }

  method get_pinned is also<get-pinned> {
    so adw_tab_page_get_pinned($!adw-tp);
  }

  method get_selected is also<get-selected> {
    so adw_tab_page_get_selected($!adw-tp);
  }

  method get_thumbnail_xalign is also<get-thumbnail-xalign> {
    adw_tab_page_get_thumbnail_xalign($!adw-tp);
  }

  method get_thumbnail_yalign is also<get-thumbnail-yalign> {
    adw_tab_page_get_thumbnail_yalign($!adw-tp);
  }

  method get_title is also<get-title> {
    adw_tab_page_get_title($!adw-tp);
  }

  method get_tooltip is also<get-tooltip> {
    adw_tab_page_get_tooltip($!adw-tp);
  }

  method invalidate_thumbnail is also<invalidate-thumbnail> {
    adw_tab_page_invalidate_thumbnail($!adw-tp);
  }

  method set_icon (GIcon() $icon) is also<set-icon> {
    adw_tab_page_set_icon($!adw-tp, $icon);
  }

  method set_indicator_activatable (Int() $activatable)
    is also<set-indicator-activatable>
  {
    my gboolean $a = $activatable.so.Int;

    adw_tab_page_set_indicator_activatable($!adw-tp, $a);
  }

  method set_indicator_icon (GIcon() $indicator_icon)
    is also<set-indicator-icon>
  {
    adw_tab_page_set_indicator_icon($!adw-tp, $indicator_icon);
  }

  method set_indicator_tooltip (Str() $tooltip)
    is also<set-indicator-tooltip>
  {
    adw_tab_page_set_indicator_tooltip($!adw-tp, $tooltip);
  }

  method set_keyword (Str() $keyword) is also<set-keyword> {
    adw_tab_page_set_keyword($!adw-tp, $keyword);
  }

  method set_live_thumbnail (Int() $live_thumbnail)
    is also<set-live-thumbnail>
  {
    my gboolean $l = $live_thumbnail.so.Int;

    adw_tab_page_set_live_thumbnail($!adw-tp, $l);
  }

  method set_loading (Int() $loading) is also<set-loading> {
    my gboolean $l = $loading.so.Int;

    adw_tab_page_set_loading($!adw-tp, $l);
  }

  method set_needs_attention (Int() $needs_attention)
    is also<set-needs-attention>
  {
    my gboolean $n = $needs_attention.so.Int;

    adw_tab_page_set_needs_attention($!adw-tp, $n);
  }

  method set_thumbnail_xalign (Num() $xalign)
    is also<set-thumbnail-xalign>
  {
    my gfloat $x = $xalign;

    adw_tab_page_set_thumbnail_xalign($!adw-tp, $x);
  }

  method set_thumbnail_yalign (Num() $yalign)
    is also<set-thumbnail-yalign>
  {
    my gfloat $y = $yalign;

    adw_tab_page_set_thumbnail_yalign($!adw-tp, $y);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_tab_page_set_title($!adw-tp, $title);
  }

  method set_tooltip (Str() $tooltip) is also<set-tooltip> {
    adw_tab_page_set_tooltip($!adw-tp, $tooltip);
  }

}
