use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Clamp;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwClampAncestry is export of Mu
  where AdwClamp | GtkWidgetAncestry;

class Adwaita::Clamp is GTK::Widget:ver<4> {
  has AdwClamp $!adw-c is implementor;

  submethod BUILD ( :$adwaita-clamp ) {
    self.setAdwClamp($adwaita-clamp)
      if $adwaita-clamp
  }

  method setAdwClamp (AdwClampAncestry $_) {
    my $to-parent;

    $!adw-c = do {
      when AdwClamp {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwClamp, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwClamp
    is also<AdwClamp>
  { $!adw-c }

  multi method new (
    $adwaita-clamp where * ~~ AdwClampAncestry,

    :$ref = True
  ) {
    return unless $adwaita-clamp;

    my $o = self.bless( :$adwaita-clamp );
    $o.ref if $ref;
    $o;
  }
  multi method new (*%a) {
    my $adwaita-clamp = adw_clamp_new();

    my $o = $adwaita-clamp ?? self.bless( :$adwaita-clamp ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
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

  method append (GtkWidget() $child)
    is also<
      add-child
      add_child
    >
  {
    self.child = $child;
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_clamp_get_child($!adw-c),
      $raw,
      $proper
    );
  }

  method get_maximum_size is also<get-maximum-size> {
    adw_clamp_get_maximum_size($!adw-c);
  }

  method get_tightening_threshold is also<get-tightening-threshold> {
    adw_clamp_get_tightening_threshold($!adw-c);
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    adw_clamp_set_child($!adw-c, $child);
  }

  method set_maximum_size (Int() $maximum_size) is also<set-maximum-size> {
    my gint $m = $maximum_size;

    adw_clamp_set_maximum_size($!adw-c, $m);
  }

  method set_tightening_threshold (Int() $tightening_threshold)
    is also<set-tightening-threshold>
  {
    my gint $t = $tightening_threshold;

    adw_clamp_set_tightening_threshold($!adw-c, $t);
  }

}
