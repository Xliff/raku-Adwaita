use v6.c;

use NativeCall;
use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Navigation;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;
use GIO::Roles::ListModel;

our subset AdwNavigationPageAncestry is export of Mu
  where AdwNavigationPage | GtkWidgetAncestry;

class Adwaita::Navigation::Page is GTK::Widget {
  has AdwNavigationPage $!anp is implementor;

  has $!sequence;

  method default-title is also<default_title> { 'widget' ~ $!sequence.shift }
  method default-tag   is also<default_tag>   { 'tag'    ~ $!sequence.shift }

  submethod BUILD ( :$widget, :$title is copy, :$tag is copy ) {
    $!sequence = (1 .. ∞);

    $title //= self.default-title;
    $tag   //= self.default-tag;

    my $adwaita-nav-page = $tag
      ?? adw_navigation_page_new_with_tag($widget, $title, $tag)
      !! adw_navigation_page_new($widget, $title);

    self.setAdwNatigationPage($adwaita-nav-page) if $adwaita-nav-page
  }

  method setAdwNavigationPage (AdwNavigationPageAncestry $_) {
    my $to-parent;

    $!anp = do {
      when AdwNavigationPage {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwNavigationPage, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwNavigationPage
    is also<AdwNavPage>
  { $!anp }

  multi method new (
     $adwaita-nav-page where * ~~ AdwNavigationPageAncestry,
    :$ref                                                    = True
  ) {
    return unless $adwaita-nav-page;

    my $o = self.bless( :$adwaita-nav-page );
    $o.ref if $ref;
    $o;
  }
  multi method new (GtkWidget() $widget, Str() $title) {
    self.bless( :$widget, :$title) // Nil
  }

  method new_with_tag (
    GtkWidget() $widget,
    Str()       $title,
    Str()       $tag
  )
    is also<new-with-tag>
  {
    self.bless( :$widget, :$title, :$tag) // Nil
  }

  # Type: boolean
  method can-pop is rw  is g-property is also<can_pop> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('can-pop', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('can-pop', $gv);
      }
    );
  }

  # Type: AdwWidget
  method child (
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
        self.prop_get('child', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $slow
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('child', $gv);
      }
    );
  }

  # Type: string
  method tag is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('tag', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('tag', $gv);
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

  # Is originally:
  # AdwNavigationPage *self --> void
  method hiding {
    self.connect($!anp, 'hiding');
  }

  # Is originally:
  # AdwNavigationPage *self --> void
  method showing {
    self.connect($!anp, 'showing');
  }

  # Is originally:
  # AdwNavigationPage *self --> void
  method shown {
    self.connect($!anp, 'shown');
  }

  # Is originally:
  # AdwNavigationPage *self --> void
  method hidden {
    self.connect($!anp, 'hidden');
  }

  method get_can_pop is also<get-can-pop> {
    adw_navigation_page_get_can_pop($!anp);
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_navigation_page_get_child($!anp),
      $raw,
      $slow,
    );
  }

  method get_tag is also<get-tag> {
    adw_navigation_page_get_tag($!anp);
  }

  method get_title is also<get-title> {
    adw_navigation_page_get_title($!anp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_navigation_page_get_type, $n, $t );
  }


  method set_can_pop (Int() $can_pop) is also<set-can-pop> {
    my gboolean $c = $can_pop.so.Int;

    adw_navigation_page_set_can_pop($!anp, $c);
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    adw_navigation_page_set_child($!anp, $child);
  }

  method set_tag (Str() $tag) is also<set-tag> {
    adw_navigation_page_set_tag($!anp, $tag);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_navigation_page_set_title($!anp, $title);
  }
}


use Adwaita::Roles::Signals::Navigation;

our subset AdwNavigationViewAncestry is export of Mu
  where AdwNavigationView | GtkWidgetAncestry;

class Adwaita::Navigation::View is GTK::Widget {
  also does Adwaita::Roles::Signals::Navigation::View;

  has AdwNavigationView $!anv is implementor;

  submethod BUILD ( :$adwaita-nav-view ) {
    self.setAdwNavigationView($adwaita-nav-view) if $adwaita-nav-view
  }

  method setAdwNavigationView (AdwNavigationViewAncestry $_) {
    my $to-parent;

    $!anv = do {
      when AdwNavigationView {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwNavigationView, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwNavigationView
  { $!anv }

  multi method new (
     $adwaita-nav-view where * ~~ AdwNavigationViewAncestry,

    :$ref                                                     = True
  ) {
    return unless $adwaita-nav-view;

    my $o = self.bless( :$adwaita-nav-view );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $adwaita-nav-view = adw_navigation_view_new();

    $adwaita-nav-view ?? self.bless( :$adwaita-nav-view ) !! Nil;
  }

  # Type: boolean
  method animate-transitions
    is rw
    is g-property
    is also<animate_transitions>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('animate-transitions', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('animate-transitions', $gv);
      }
    );
  }

  # Type: boolean
  method pop-on-escape is rw  is g-property is also<pop_on_escape> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pop-on-escape', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('pop-on-escape', $gv);
      }
    );
  }

  # Type: GListModel
  method navigation-stack ( :$raw = False )
    is rw
    is g-property
    is also<navigation_stack>
  {
    my $gv = GLib::Value.new( GIO::ListModel.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('navigation-stack', $gv);
        propReturnObject( $gv.object, $raw, |GIO::ListModel.getTypePair );
      },
      STORE => -> $,  $val is copy {
        warn 'navigation-stack does not allow writing'
      }
    );
  }

  # Type: AdwNavigationPage
  method visible-page ( :$raw = False )
    is rw
    is g-property
    is also<visible_page>
  {
    my $gv = GLib::Value.new( Adwaita::Navigation::Page.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible-page', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Navigation::Page.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'visible-page does not allow writing'
      }
    );
  }

  # Is originally:
  # AdwNavigationView *self --> void
  method pushed {
    self.connect($!anv, 'pushed');
  }

  # Is originally:
  # AdwNavigationView *self --> void
  method popped {
    self.connect($!anv, 'popped');
  }

  # Is originally:
  # AdwNavigationView *self --> void
  method replaced {
    self.connect($!anv, 'replaced');
  }

  # Is originally:
  # AdwNavigationView *self --> AdwNagivationPage
  method get-next-page is also<get_next_page> {
    self.connect-navigation-page($!anv, 'get-next-page');
  }

  method add (AdwNavigationPage() $page) {
    adw_navigation_view_add($!anv, $page);
  }

  method find_page (Str() $tag, :$raw = False) is also<find-page> {
    propReturnObject(
      adw_navigation_view_find_page($!anv, $tag),
      $raw,
      |Adwaita::Navigation::Page.getTypePair
    );
  }

  method get_animate_transitions is also<get-animate-transitions> {
    adw_navigation_view_get_animate_transitions($!anv);
  }

  method get_navigation_stack ( :$raw = False )
    is also<get-navigation-stack>
  {
    propReturnObject(
      adw_navigation_view_get_navigation_stack($!anv),
      $raw,
      |GIO::ListModel.getTypePair
    );
  }

  method get_pop_on_escape is also<get-pop-on-escape> {
    so adw_navigation_view_get_pop_on_escape($!anv);
  }

  method get_previous_page (AdwNavigationPage() $page, :$raw = False)
    is also<get-previous-page>
  {
    propReturnObject(
      adw_navigation_view_get_previous_page($!anv, $page),
      $raw,
      |Adwaita::Naviation::Page.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_navigation_view_get_type, $n, $t );
  }

  method get_visible_page ( :$raw = False ) is also<get-visible-page> {
    propReturnObject(
      adw_navigation_view_get_visible_page($!anv),
      $raw,
      |Adwaita::Navigation::Page.getTypePair
    );
  }

  method pop {
    so adw_navigation_view_pop($!anv);
  }

  method pop_to_page (AdwNavigationPage() $page) is also<pop-to-page> {
    so adw_navigation_view_pop_to_page($!anv, $page);
  }

  method pop_to_tag (Str() $tag) is also<pop-to-tag> {
    so adw_navigation_view_pop_to_tag($!anv, $tag);
  }

  method push (AdwNavigationPage() $page) {
    adw_navigation_view_push($!anv, $page);
  }

  method push_by_tag (Str() $tag) is also<push-by-tag> {
    adw_navigation_view_push_by_tag($!anv, $tag);
  }

  method remove (AdwNavigationPage() $page) {
    adw_navigation_view_remove($!anv, $page);
  }

  multi method replace (@pages) {
    samewith(
      ArrayToCArray(AdwNavigationPage, @pages),
      @pages.elems
    );
  }
  multi method replace (
    CArray[AdwNavigationPage] $pages,
    Int()                     $n_pages
  ) {
    my gint $n = $n_pages;
    adw_navigation_view_replace($!anv, $pages, $n);
  }

  proto method replace_with_tags (|)
  { * }

  multi method replace_with_tags (@tags) {
    samewith(
      ArrayToCArray(Str, @tags),
      @tags.elems
    );
  }
  multi method replace_with_tags (CArray[Str] $tags, Int() $n_tags)
    is also<replace-with-tags>
  {
    my gint $n = $n_tags;

    adw_navigation_view_replace_with_tags($!anv, $tags, $n_tags);
  }

  method set_animate_transitions (Int() $animate_transitions)
    is also<set-animate-transitions>
  {
    my gboolean $a = $animate_transitions.so.Int;

    adw_navigation_view_set_animate_transitions($!anv, $a);
  }

  method set_pop_on_escape (Int() $pop_on_escape)
    is also<set-pop-on-escape>
  {
    my gboolean $p = $pop_on_escape;

    adw_navigation_view_set_pop_on_escape($!anv, $p);
  }
}
