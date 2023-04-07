use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::View::Switcher::Title;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwViewSwitcherTitleAncestry is export of Mu
  where AdwViewSwitcherTitle | GtkWidgetAncestry;

class Adwaita::View::Switcher::Title is GTK::Widget:ver<4> {
  has AdwViewSwitcherTitle $!adw-vst is implementor;

  submethod BUILD ( :$adw-view-switcher-title ) {
    self.setAdwViewSwitcherTitle($adw-view-switcher-title)
      if $adw-view-switcher-title
  }

  method setAdwViewSwitcherTitle (AdwViewSwitcherTitleAncestry $_) {
    my $to-parent;

    $!adw-vst = do {
      when AdwViewSwitcherTitle {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwViewSwitcherTitle, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwViewSwitcherTitle
    is also<AdwViewSwitcherTitle>
  { $!adw-vst }

  multi method new (
    $adw-view-switcher-title where * ~~ AdwViewSwitcherTitleAncestry,

    :$ref = True
  ) {
    return unless $adw-view-switcher-title;

    my $o = self.bless( :$adw-view-switcher-title );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-view-switcher-title = adw_view_switcher_title_new();

    my $o = $adw-view-switcher-title ?? self.bless( :$adw-view-switcher-title )
                                     !! Nil;
    $o.setAttributes(%a);
    $o;
  }

  # Type: AdwViewStack
  method stack ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Adwaita::View::Stack.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('stack', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::View::Stack.getTypePair
        );
      },
      STORE => -> $, AdwViewStack() $val is copy {
        $gv.object = $val;
        self.prop_set('stack', $gv);
      }
    );
  }

  # Type: string
  method subtitle is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('subtitle', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('subtitle', $gv);
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
  method title-visible is rw  is g-property is also<title_visible> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title-visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'title-visible does not allow writing'
      }
    );
  }

  # Type: boolean
  method view-switcher-enabled
    is rw
    is g-property
    is also<view_switcher_enabled>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('view-switcher-enabled', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('view-switcher-enabled', $gv);
      }
    );
  }

  method get_stack ( :$raw = False ) is also<get-stack> {
    propReturnObject(
      adw_view_switcher_title_get_stack($!adw-vst),
      $raw,
      |Adwaita::View::Stack.getTypePair
    );

  }

  method get_subtitle is also<get-subtitle> {
    adw_view_switcher_title_get_subtitle($!adw-vst);
  }

  method get_title is also<get-title> {
    adw_view_switcher_title_get_title($!adw-vst);
  }

  method get_title_visible is also<get-title-visible> {
    so adw_view_switcher_title_get_title_visible($!adw-vst);
  }

  method get_view_switcher_enabled is also<get-view-switcher-enabled> {
    so adw_view_switcher_title_get_view_switcher_enabled($!adw-vst);
  }

  method set_stack (AdwViewStack() $stack) is also<set-stack> {
    adw_view_switcher_title_set_stack($!adw-vst, $stack);
  }

  method set_subtitle (Str() $subtitle) is also<set-subtitle> {
    adw_view_switcher_title_set_subtitle($!adw-vst, $subtitle);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_view_switcher_title_set_title($!adw-vst, $title);
  }

  method set_view_switcher_enabled (Int() $enabled)
    is also<set-view-switcher-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    adw_view_switcher_title_set_view_switcher_enabled($!adw-vst, $e);
  }

}
