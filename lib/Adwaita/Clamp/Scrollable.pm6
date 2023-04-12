use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Clamp::Scrollable;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;
use GTK::Roles::Orientable:ver<4>;
use GTK::Roles::Scrollable:ver<4>;

our subset AdwClampScrollableAncestry is export of Mu
  where AdwClampScrollable | GtkOrientable | GtkScrollable | GObject;

class Adwaita::Clamp::Scrollable is GTK::Widget:ver<4> {
  also does GTK::Roles::Orientable;
  also does GTK::Roles::Scrollable;

  has AdwClampScrollable $!adw-cs is implementor;

  submethod BUILD ( :$adw-clamp-scrollable ) {
    self.setAdwClampScrollable($adw-clamp-scrollable)
      if $adw-clamp-scrollable
  }

  method setAdwClampScrollable (AdwClampScrollableAncestry $_) {
    my $to-parent;

    $!adw-cs = do {
      when AdwClampScrollable {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      when GtkOrientable {
        $to-parent = cast(GtkWidget, $_);
        $!gtk-o    = $_;
        cast(AdwClampScrollable, $_);
      }

      when GtkScrollable {
        $to-parent   = cast(GtkWidget, $_);
        $!gtk-scroll = $_;
        cast(AdwClampScrollable, $_);
      }

      default {
        $to-parent = $_;
        cast(AdwClampScrollable, $_);
      }
    }
    self.setGtkWidget($to-parent);
    self.roleInit-GtkOrientable;
    self.roleInit-GtkScrollable;
  }

  method Adwaita::Raw::Definitions::AdwClampScrollable
    is also<AdwClampScrollable>
  { $!adw-cs }

  multi method new (
    $adw-clamp-scrollable where * ~~ AdwClampScrollableAncestry,

    :$ref = True
  ) {
    return unless $adw-clamp-scrollable;

    my $o = self.bless( :$adw-clamp-scrollable );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-clamp-scrollable = adw_clamp_scrollable_new();

    my $o = $adw-clamp-scrollable ?? self.bless( :$adw-clamp-scrollable )
                                  !! Nil;
    $o.setAttributes(%a) if $o && +%a;
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

  # Type: int
  method maximum-size is rw  is g-property is also<maximum_size> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('maximum-size', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('maximum-size', $gv);
      }
    );
  }

  # Type: int
  method tightening-threshold
    is rw
    is g-property
    is also<tightening_threshold>
  {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('tightening-threshold', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('tightening-threshold', $gv);
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
      adw_clamp_scrollable_get_child($!adw-cs),
      $raw,
      $proper
    );
  }

  method get_maximum_size is also<get-maximum-size> {
    adw_clamp_scrollable_get_maximum_size($!adw-cs);
  }

  method get_tightening_threshold is also<get-tightening-threshold> {
    adw_clamp_scrollable_get_tightening_threshold($!adw-cs);
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    adw_clamp_scrollable_set_child($!adw-cs, $child);
  }

  method set_maximum_size (Int() $maximum_size) is also<set-maximum-size> {
    my gint $m = $maximum_size;

    adw_clamp_scrollable_set_maximum_size($!adw-cs, $m);
  }

  method set_tightening_threshold (Int() $tightening_threshold)
    is also<set-tightening-threshold>
  {
    my gint $t = $tightening_threshold;

    adw_clamp_scrollable_set_tightening_threshold($!adw-cs, $t);
  }

}
