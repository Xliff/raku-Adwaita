use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwToastOverlayAncestry is export of Mu
  where AdwToastOverlay | GtkWidgetAncestry;

class Adwaita::Toast::Overlay is GTK::Widget:ver<4> {
  has AdwToastOverlay $!adw-to is implementor;

  submethod BUILD ( :$adw-toast-overlay ) {
    self.setAdwToastOverlay($adw-toast-overlay) if $adw-toast-overlay;
  }

  method setAdwToastOverlay (AdwToastOverlayAncestry $_) {
    my $to-parent;

    $!adw-to = do {
      when AdwToastOverlay {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwToastOverlay, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwToastOverlay
    is also<AdwToastOverlay>
  { $!adw-to }

  multi method new (
    $adw-toast-overlay where * ~~ AdwToastOverlayAncestry,

    :$ref = True
  ) {
    return unless $adw-toast-overlay;

    my $o = self.bless( :$adw-toast-overlay );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-toast-overlay = adw_toast_overlay_new();

    my $o = $adw-toast-overlay ?? self.bless( :$adw-toast-overlay ) !! Nil;
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
        #self.setBuildableChild(0, $val);
        $gv.object = $val;
        self.prop_set('child', $gv);
      }
    );
  }

  method add_toast (AdwToast() $toast) is also<add-toast> {
    adw_toast_overlay_add_toast($!adw-to, $toast);
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_toast_overlay_get_child($!adw-to),
      $raw,
      $proper
    );
  }

  method set_child (GtkWidget() $child)
    is also<
      set-child
      append
      add_child
      add-child
    >
  {
    #self.addBuildableChild(0, $child);
    adw_toast_overlay_set_child($!adw-to, $child);
  }

}

### /usr/src/libadwaita-1-1.2.0/src/adw-toast-overlay.h

sub adw_toast_overlay_add_toast (
  AdwToastOverlay $self,
  AdwToast        $toast
)
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_overlay_get_child (AdwToastOverlay $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_overlay_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_overlay_set_child (
  AdwToastOverlay $self,
  GtkWidget       $child
)
  is      native(adwaita)
  is      export
{ * }
