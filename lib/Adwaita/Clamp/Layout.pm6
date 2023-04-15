use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::LayoutManager:ver<4>;

use GLib::Roles::Implementor;

our subset AdwClampLayoutAncestry is export of Mu
  where AdwClampLayout | GtkLayoutManagerAncestry;

class Adwaita::Clamp::Layout is GTK::LayoutManager:ver<4> {
  has AdwClampLayout $!adw-cl is implementor;

  submethod BUILD ( :$adw-clamp-layout ) {
    self.setAdwClampLayout($adw-clamp-layout) if $adw-clamp-layout
  }

  method setAdwClampLayout (AdwClampLayoutAncestry $_) {
    my $to-parent;

    $!adw-cl = do {
      when AdwClampLayout {
        $to-parent = cast(GtkLayoutManager, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwClampLayout, $_);
      }
    }
    self.setGtkLayoutManager($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwClampLayout
    is also<AdwClampLayout>
  { $!adw-cl }

  multi method new (
    $adw-clamp-layout where * ~~ AdwClampLayoutAncestry,

    :$ref = True
  ) {
    return unless $adw-clamp-layout;

    my $o = self.bless( :$adw-clamp-layout );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-clamp-layout = adw_clamp_layout_new();

    my $o = $adw-clamp-layout ?? self.bless( :$adw-clamp-layout ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
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

  method get_maximum_size is also<get-maximum-size> {
    adw_clamp_layout_get_maximum_size($!adw-cl);
  }

  method get_tightening_threshold is also<get-tightening-threshold> {
    adw_clamp_layout_get_tightening_threshold($!adw-cl);
  }

  method set_maximum_size (Int() $maximum_size) is also<set-maximum-size> {
    my gint $m = $maximum_size;

    adw_clamp_layout_set_maximum_size($!adw-cl, $m);
  }

  method set_tightening_threshold (Int() $tightening_threshold)
    is also<set-tightening-threshold>
  {
    my gint $t = $tightening_threshold;

    adw_clamp_layout_set_tightening_threshold($!adw-cl, $t);
  }

}

### /usr/src/libadwaita-1-1.3~alpha/src/adw-clamp-layout.h

sub adw_clamp_layout_get_maximum_size (AdwClampLayout $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_layout_get_tightening_threshold (AdwClampLayout $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_layout_new
  returns AdwClampLayout
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_layout_set_maximum_size (
  AdwClampLayout $self,
  gint           $maximum_size
)
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_layout_set_tightening_threshold (
  AdwClampLayout $self,
  gint           $tightening_threshold
)
  is      native(adwaita)
  is      export
{ * }
