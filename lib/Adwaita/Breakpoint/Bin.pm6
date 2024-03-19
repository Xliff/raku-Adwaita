use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Breakpoint::Bin;

use GTK::Widget:ver<4>;
use Adwaita::Breakpoint;

use GLib::Roles::Implementor;

our subset AdwBreakpointBinAncestry is export of Mu
  where AdwBreakpointBin | GtkWidgetAncestry;

class Adwaita::Breakpoint::Bin is GTK::Widget {
  has AdwBreakpointBin $!adw-bb is implementor;

  submethod BUILD ( :$adw-break-bin ) {
    self.setAdwBreakpointBin($adw-break-bin) if $adw-break-bin
  }

  method setAdwBreakpointBin (AdwBreakpointBinAncestry $_) {
    my $to-parent;

    $!adw-bb = do {
      when AdwBreakpointBin {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwBreakpointBin, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwBreakpointBin
    is also<AdwBreakpointBin>
  { $!adw-bb }

  multi method new (
     $adw-break-bin where * ~~ AdwBreakpointBinAncestry,

    :$ref                                                 = True
  ) {
    return unless $adw-break-bin;

    my $o = self.bless( :$adw-break-bin );
    $o.ref if $ref;
    $o;
  }
  multi method new (AdwBreakpoint() $break) {
    my $adw-break-bin = adw_breakpoint_bin_new($break);

    $adw-break-bin ?? self.bless( :$adw-break-bin ) !! Nil
  }

  # Type: GtkWidget
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

  # Type: AdwBreakpoint
  method current-breakpoint ( :$raw = False )
    is rw
    is g-property
    is also<current_breakpoint>
  {
    my $gv = GLib::Value.new( Adwaita::Breakpoint.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('current-breakpoint', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::BreakPoint.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'current-breakpoint does not allow writing'
      }
    );
  }


  method add_breakpoint (AdwBreakpoint() $breakpoint) is also<add-breakpoint> {
    adw_breakpoint_bin_add_breakpoint($!adw-bb, $breakpoint);
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_breakpoint_bin_get_child($!adw-bb),
      $raw,
      $slow
    );
  }

  method get_current_breakpoint ( :$raw = False )
    is also<get-current-breakpoint>
  {
    propReturnObject(
      adw_breakpoint_bin_get_current_breakpoint($!adw-bb),
      $raw,
      |Adwaita::Breakpoint.getTypePair
    );
  }

  method remove_breakpoint (AdwBreakpoint() $breakpoint)
    is also<remove-breakpoint>
  {
    adw_breakpoint_bin_remove_breakpoint($!adw-bb, $breakpoint);
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    adw_breakpoint_bin_set_child($!adw-bb, $child);
  }

}
