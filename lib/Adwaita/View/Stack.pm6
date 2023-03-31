use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::View::Stack;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;
use GTK::Roles::SelectionModel:ver<4>;

our subset AdwViewStackAncestry is export of Mu
  where AdwViewStack | GtkWidgetAncestry;

class Adwaita::View::Stack is GTK::Widget:ver<4> {
  has AdwViewStack $!adw-vs is implementor;

  submethod BUILD ( :$adw-view-stack ) {
    self.setAdwViewStack($adw-view-stack) if $adw-view-stack
  }

  method setAdwViewStack (AdwViewStackAncestry $_) {
    my $to-parent;

    $!adw-vs = do {
      when AdwViewStack {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwViewStack, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwViewStack
    is also<AdwViewStack>
  { $!adw-vs }

  multi method new (
    $adw-view-stack where * ~~ AdwViewStackAncestry,

    :$ref = True
  ) {
    return unless $adw-view-stack;

    my $o = self.bless( :$adw-view-stack );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-view-stack = adw_view_stack_new();

    my $o = $adw-view-stack ?? self.bless( :$adw-view-stack ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method hhomogeneous is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('hhomogeneous', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('hhomogeneous', $gv);
      }
    );
  }

  # Type: GtkSelectionModel
  method pages ( :$raw = False, :$model = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::SelectionModel.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pages', $gv);
        returnSelectionModel(
          $gv.object,
          $raw,
          $model,
          |Adwaita::View::Stack::Page.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'pages does not allow writing'
      }
    );
  }

  # Type: boolean
  method vhomogeneous is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('vhomogeneous', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('vhomogeneous', $gv);
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
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('visible-child', $gv);
      }
    );
  }

  # Type: string
  method visible-child-name is rw  is g-property is also<visible_child_name> {
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

  method add (GtkWidget() $child)
    is also<
      add-child
      add_child
    >
  {
    #self.addBuildableChild($child)
    adw_view_stack_add($!adw-vs, $child);
  }

  method add_named (GtkWidget() $child, Str() $name)
    is also<add-named>
  {
    #self.addBuildableChild($child, name => $name)
    adw_view_stack_add_named($!adw-vs, $child, $name);
  }

  method add_titled (GtkWidget() $child, Str() $name, Str() $title)
    is also<add-titled>
  {
    #self.addBuildableChild($child, name => $name, title => $title)
    adw_view_stack_add_titled($!adw-vs, $child, $name, $title);
  }

  method add_titled_with_icon (
    GtkWidget()    $child,
    Str()          $name,
    Str()          $title,
    Str()          $icon_name
  )
    is also<add-titled-with-icon>
  {
    #self.addBuildableChild($child)
    adw_view_stack_add_titled_with_icon(
      $!adw-vs,
      $child,
      $name,
      $title,
      $icon_name
    );
  }

  method get_child_by_name (Str() $name)
    is also<get-child-by-name>
  {
    adw_view_stack_get_child_by_name($!adw-vs, $name);
  }

  method get_hhomogeneous is also<get-hhomogeneous> {
    so adw_view_stack_get_hhomogeneous($!adw-vs);
  }

  method get_page (GtkWidget() $child, :$raw = False)
    is also<get-page>
  {
    propReturnObject(
      adw_view_stack_get_page($!adw-vs, $child),
      $raw,
      ::('Adwaita::View::Stack::Page').getTypePair
    );
  }

  method get_pages ( :$raw = False )  is also<get-pages> {
    propReturnObject(
      adw_view_stack_get_pages($!adw-vs),
      $raw,
      |GTK::SelectionModel.getTypePair
    );
  }

  method get_vhomogeneous is also<get-vhomogeneous> {
    so adw_view_stack_get_vhomogeneous($!adw-vs);
  }

  method get_visible_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-visible-child>
  {
    returnProperWidget(
      adw_view_stack_get_visible_child($!adw-vs),
      $raw,
      $proper
    );
  }

  method get_visible_child_name is also<get-visible-child-name> {
    adw_view_stack_get_visible_child_name($!adw-vs);
  }

  method remove (GtkWidget() $child) {
    #self.removeBuildableChild($child);
    adw_view_stack_remove($!adw-vs, $child);
  }

  method set_hhomogeneous (Int() $hhomogeneous)
    is also<set-hhomogeneous>
  {
    my gboolean $h = $hhomogeneous.so.Int;

    adw_view_stack_set_hhomogeneous($!adw-vs, $h);
  }

  method set_vhomogeneous (Int() $vhomogeneous)
    is also<set-vhomogeneous>
  {
    my gboolean $v = $vhomogeneous.so.Int;

    adw_view_stack_set_vhomogeneous($!adw-vs, $v);
  }

  method set_visible_child (GtkWidget() $child)
    is also<set-visible-child>
  {
    adw_view_stack_set_visible_child($!adw-vs, $child);
  }

  method set_visible_child_name (Str() $name)
    is also<set-visible-child-name>
  {
    adw_view_stack_set_visible_child_name($!adw-vs, $name);
  }

}


our subset AdwViewStackPageAncestry is export of Mu
  where AdwViewStackPage | GtkWidgetAncestry;

class Adwaita::View::Stack::Page is GTK::Widget:ver<4> {
  has AdwViewStackPage $!adw-vsp is implementor;

  submethod BUILD ( :$adw-view-page ) {
    self.setAdwViewStackPage($adw-view-page) if $adw-view-page
  }

  method setAdwViewStackPage (AdwViewStackPageAncestry $_) {
    my $to-parent;

    $!adw-vsp = do {
      when AdwViewStackPage {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwViewStackPage, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwViewStackPage
    is also<AdwViewStackPage>
  { $!adw-vsp }

  multi method new (
    $adw-view-page where * ~~ AdwViewStackPageAncestry,

    :$ref = True
  ) {
    return unless $adw-view-page;

    my $o = self.bless( :$adw-view-page );
    $o.ref if $ref;
    $o;
  }

  # Type: uint
  method badge-number is rw  is g-property is also<badge_number> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('badge-number', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('badge-number', $gv);
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

  # Type: string
  method icon-name is rw  is g-property is also<icon_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('icon-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('icon-name', $gv);
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

  # Type: boolean
  method use-underline is rw  is g-property is also<use_underline> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-underline', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-underline', $gv);
      }
    );
  }

  # Type: boolean
  method visible is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('visible', $gv);
      }
    );
  }

  method get_badge_number is also<get-badge-number> {
    adw_view_stack_page_get_badge_number($!adw-vsp);
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_view_stack_page_get_child($!adw-vsp),
      $raw,
      $proper
    );
  }

  method get_icon_name is also<get-icon-name> {
    adw_view_stack_page_get_icon_name($!adw-vsp);
  }

  method get_name is also<get-name> {
    adw_view_stack_page_get_name($!adw-vsp);
  }

  method get_needs_attention is also<get-needs-attention> {
    so adw_view_stack_page_get_needs_attention($!adw-vsp);
  }

  method get_title is also<get-title> {
    adw_view_stack_page_get_title($!adw-vsp);
  }

  method get_use_underline is also<get-use-underline> {
    so adw_view_stack_page_get_use_underline($!adw-vsp);
  }

  method get_visible is also<get-visible> {
    so adw_view_stack_page_get_visible($!adw-vsp);
  }

  method set_badge_number (Int() $badge_number) is also<set-badge-number> {
    my guint $b = $badge_number;

    adw_view_stack_page_set_badge_number($!adw-vsp, $b);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    adw_view_stack_page_set_icon_name($!adw-vsp, $icon_name);
  }

  method set_name (Str() $name) is also<set-name> {
    adw_view_stack_page_set_name($!adw-vsp, $name);
  }

  method set_needs_attention (Int() $needs_attention)
    is also<set-needs-attention>
  {
    my gboolean $n = $needs_attention.so.Int;

    adw_view_stack_page_set_needs_attention($!adw-vsp, $n);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_view_stack_page_set_title($!adw-vsp, $title);
  }

  method set_use_underline (Int() $use_underline) is also<set-use-underline> {
    my gboolean $u = $use_underline.so.Int;

    adw_view_stack_page_set_use_underline($!adw-vsp, $u);
  }

  method set_visible (Int() $visible) is also<set-visible> {
    my gboolean $v = $visible.so.Int;

    adw_view_stack_page_set_visible($!adw-vsp, $v);
  }

}
