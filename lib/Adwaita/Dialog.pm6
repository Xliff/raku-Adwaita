use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Dialog;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwDialogAncestry is export of Mu
  where AdwDialog | GtkWidgetAncestry;

class Adwaita::Dialog is GTK::Widget {
  has AdwDialog $!adw-d is implementor;

  submethod BUILD ( :$adwaita-dialog ) {
    self.setAdwDialog($adwaita-dialog) if $adwaita-dialog
  }

  method setAdwDialog (AdwDialogAncestry $_) {
    my $to-parent;

    $!adw-d = do {
      when AdwDialog {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwDialog, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwDialog
    is also<AdwDialog>
  { $!adw-d }

  multi method new (
     $adwaita-dialog where * ~~ AdwDialogAncestry,

    :$ref                                          = True
  ) {
    return unless $adwaita-dialog;

    my $o = self.bless( :$adwaita-dialog );
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $adwaita-dialog = adw_dialog_new();

    $adwaita-dialog ?? self.bless( :$adwaita-dialog ) !! Nil;
  }

  # Type: boolean
  method can-close is rw  is g-property is also<can_close> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('can-close', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('can-close', $gv);
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

  # Type: int
  method content-height is rw  is g-property is also<content_height> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content-height', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('content-height', $gv);
      }
    );
  }

  # Type: int
  method content-width is rw  is g-property is also<content_width> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content-width', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('content-width', $gv);
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
          |Adwaita::Breakpoint.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'current-breakpoint does not allow writing'
      }
    );
  }

  # Type: GtkWidget
  method default-widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is rw
    is g-property

    is also<default_widget>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-widget', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $slow
        )
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('default-widget', $gv);
      }
    );
  }

  # Type: GtkWidget
  method focus-widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is rw
    is g-property

    is also<focus_widget>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('focus-widget', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $slow
        )
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('focus-widget', $gv);
      }
    );
  }

  # Type: boolean
  method follows-content-size
    is rw
    is g-property
    is also<follows_content_size>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('follows-content-size', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('follows-content-size', $gv);
      }
    );
  }

  # Type: AdwDialogPresentationMode
  # NYI
  # method presentation-mode is rw  is g-property {
  #   my $gv = GLib::Value.new( AdwDialogPresentationMode );
  #   Proxy.new(
  #     FETCH => sub ($) {
  #       self.prop_get('presentation-mode', $gv);
  #       $gv.AdwDialogPresentationMode;
  #     },
  #     STORE => -> $,  $val is copy {
  #       $gv.AdwDialogPresentationMode = $val;
  #       self.prop_set('presentation-mode', $gv);
  #     }
  #   );
  # }

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
  # AdwDialog *dialog --> void
  method close-attempt is also<close_attempt> {
    self.connect($!adw-d, 'close-attempt');
  }

  # Is originally:
  # AdwDialog *dialog --> void
  method closed {
    self.connect($!adw-d, 'closed');
  }

  method add_breakpoint (AdwBreakpoint() $breakpoint)
    is also<add-breakpoint>
  {
    adw_dialog_add_breakpoint($!adw-d, $breakpoint);
  }

  method close {
    adw_dialog_close($!adw-d);
  }

  method force_close is also<force-close> {
    adw_dialog_force_close($!adw-d);
  }

  method get_can_close is also<get-can-close> {
    so adw_dialog_get_can_close($!adw-d);
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_dialog_get_child($!adw-d),
      $raw,
      $slow
    );
  }

  method get_content_height is also<get-content-height> {
    adw_dialog_get_content_height($!adw-d);
  }

  method get_content_width is also<get-content-width> {
    adw_dialog_get_content_width($!adw-d);
  }

  method get_current_breakpoint is also<get-current-breakpoint> {
    adw_dialog_get_current_breakpoint($!adw-d);
  }

  method get_default_widget (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-default-widget>
  {
    returnProperWidget(
      adw_dialog_get_default_widget($!adw-d),
      $raw,
      $slow
    );
  }

  method get_focus (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-focus>
  {
    returnProperWidget(
      adw_dialog_get_focus($!adw-d),
      $raw,
      $slow
    );
  }

  method get_follows_content_size is also<get-follows-content-size> {
    adw_dialog_get_follows_content_size($!adw-d);
  }

  method get_presentation_mode ( :$enum = True )
    is also<get-presentation-mode>
  {
    my $p = adw_dialog_get_presentation_mode($!adw-d);
    return $p unless $enum;
    AdwDialogPresentationModeEnum($p);
  }

  method get_title is also<get-title> {
    adw_dialog_get_title($!adw-d);
  }

  method present (GtkWidget() $parent) {
    adw_dialog_present($!adw-d, $parent);
  }

  method set_can_close (gboolean  $can_close) is also<set-can-close> {
    adw_dialog_set_can_close($!adw-d, $can_close);
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    adw_dialog_set_child($!adw-d, $child);
  }

  method set_content_height (Int() $content_height)
    is also<set-content-height> {
    my gint $c = $content_height;

    adw_dialog_set_content_height($!adw-d, $c);
  }

  method set_content_width (Int() $content_width) is also<set-content-width> {
    my gint $c = $content_width;

    adw_dialog_set_content_width($!adw-d, $c);
  }

  method set_default_widget (GtkWidget() $default_widget)
    is also<set-default-widget>
  {
    adw_dialog_set_default_widget($!adw-d, $default_widget);
  }

  method set_focus (GtkWidget() $focus) is also<set-focus> {
    adw_dialog_set_focus($!adw-d, $focus);
  }

  method set_follows_content_size (Int() $follows_content_size)
    is also<set-follows-content-size>
  {
    my gboolean $f = $follows_content_size.so.Int;

    adw_dialog_set_follows_content_size($!adw-d, $f);
  }

  method set_presentation_mode (Int() $presentation_mode)
    is also<set-presentation-mode>
  {
    my AdwDialogPresentationMode $p = $presentation_mode;

    adw_dialog_set_presentation_mode($!adw-d, $p);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_dialog_set_title($!adw-d, $title);
  }

}
