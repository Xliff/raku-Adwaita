use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwBinAncestry is export of Mu
  where AdwBin | GtkWidgetAncestry;

class Adwaita::Bin is GTK::Widget:ver<4> {
  has AdwBin $!adw-b is implementor;

  submethod BUILD ( :$adw-bin ) {
    self.setAdwBin($adw-bin) if $adw-bin
  }

  method setAdwBin (AdwBinAncestry $_) {
    my $to-parent;

    $!adw-b = do {
      when AdwBin {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwBin, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwBin
    is also<AdwBin>
  { $!adw-b }

  multi method new ($adw-bin where * ~~ AdwBinAncestry, :$ref = True) {
    return unless $adw-bin;

    my $o = self.bless( :$adw-bin );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-bin = adw_bin_new();

    my $o = $adw-bin ?? self.bless( :$adw-bin ) !! Nil;
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

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_bin_get_child($!adw-b),
      $raw,
      $proper
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_bin_get_type, $n, $t );
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    adw_bin_set_child($!adw-b, $child);
  }

}

### /usr/src/libadwaita-1-1.2.0/src/adw-bin.h

sub adw_bin_get_child (AdwBin $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_bin_new
  returns AdwBin
  is      native(adwaita)
  is      export
{ * }

sub adw_bin_set_child (
  AdwBin    $self,
  GtkWidget $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_bin_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
