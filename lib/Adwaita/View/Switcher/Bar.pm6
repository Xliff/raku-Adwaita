use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Widget:ver<4>;
use Adwaita::View::Stack;

use GLib::Roles::Implementor;

our subset AdwViewSwitcherBarAncestry is export of Mu
  where AdwViewSwitcherBar | GtkWidgetAncestry;

class Adwaita::View::Switcher::Bar is GTK::Widget:ver<4> {
  has AdwViewSwitcherBar $!adw-vsb is implementor;

  submethod BUILD ( :$adw-switcher-bar ) {
    self.setAdwViewSwitcherBar($adw-switcher-bar) if $adw-switcher-bar
  }

  method setAdwViewSwitcherBar (AdwViewSwitcherBarAncestry $_) {
    my $to-parent;

    $!adw-vsb = do {
      when AdwViewSwitcherBar {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwViewSwitcherBar, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwViewSwitcherBar
    is also<AdwViewSwitcherBar>
  { $!adw-vsb }

  multi method new (
    $adw-switcher-bar where * ~~ AdwViewSwitcherBarAncestry,

    :$ref = True
  ) {
    return unless $adw-switcher-bar;

    my $o = self.bless( :$adw-switcher-bar );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-switcher-bar = adw_view_switcher_bar_new();

    my $o = $adw-switcher-bar ?? self.bless( :$adw-switcher-bar ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method reveal is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reveal', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('reveal', $gv);
      }
    );
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

  method get_reveal is also<get-reveal> {
    so adw_view_switcher_bar_get_reveal($!adw-vsb);
  }

  method get_stack ( :$raw = False ) is also<get-stack> {
    propReturnObject(
      adw_view_switcher_bar_get_stack($!adw-vsb),
      $raw,
      |Adwaita::View::Stack.getTypePair
    );
  }

  method set_reveal (Int() $reveal) is also<set-reveal> {
    my gboolean $r = $reveal.so.Int;

    adw_view_switcher_bar_set_reveal($!adw-vsb, $r);
  }

  method set_stack (AdwViewStack() $stack) is also<set-stack> {
    adw_view_switcher_bar_set_stack($!adw-vsb, $stack);
  }

}


### /usr/src/libadwaita-1-1.3~alpha/src/adw-view-switcher-bar.h

sub adw_view_switcher_bar_get_reveal (AdwViewSwitcherBar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_bar_get_stack (AdwViewSwitcherBar $self)
  returns AdwViewStack
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_bar_new
  returns AdwViewSwitcherBar
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_bar_set_reveal (
  AdwViewSwitcherBar $self,
  gboolean           $reveal
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_bar_set_stack (
  AdwViewSwitcherBar $self,
  AdwViewStack       $stack
)
  is      native(adwaita)
  is      export
{ * }
