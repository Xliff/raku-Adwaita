use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Dialog::Alert;

use GTK::Widget;
use Adwaita::Dialog;

use GLib::Roles::Implementor;

our subset AdwAlertDialogAncestry is export of Mu
  where AdwAlertDialog | AdwDialogAncestry;

class Adwaita::Dialog::Alert is Adwaita::Dialog {
  has AdwAlertDialog $!adw-al-d is implementor;

  submethod BUILD ( :$adw-alert-dlg ) {
    self.setAdwAlertDialog($adw-alert-dlg) if $adw-alert-dlg
  }

  method setAdwAlertDialog (AdwAlertDialogAncestry $_) {
    my $to-parent;

    $!adw-al-d = do {
      when AdwAlertDialog {
        $to-parent = cast(AdwDialog, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwAlertDialog, $_);
      }
    }
    self.setAdwDialog($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwAlertDialog
    is also<AdwAlertDialog>
  { $!adw-al-d }

  multi method new (
    $adw-alert-dlg where * ~~ AdwAlertDialogAncestry,

    :$ref                                             = True
  ) {
    return unless $adw-alert-dlg;

    my $o = self.bless( :$adw-alert-dlg );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $heading, Str() $body) {
    my $adw-alert-dlg = adw_alert_dialog_new($heading, $body);

    $adw-alert-dlg ?? self.bless( :$adw-alert-dlg ) !! Nil;
  }

  # Type: string
  method body is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('body', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('body', $gv);
      }
    );
  }

  # Type: boolean
  method body-use-markup is rw  is g-property is also<body_use_markup> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('body-use-markup', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('body-use-markup', $gv);
      }
    );
  }

  # Type: string
  method close-response is rw  is g-property is also<close_response> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('close-response', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('close-response', $gv);
      }
    );
  }

  # Type: string
  method default-response is rw  is g-property is also<default_response> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('default-response', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('default-response', $gv);
      }
    );
  }

  # Type: GtkWidget
  method extra-child is rw  is g-property is also<extra_child> {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('extra-child', $gv);
        $gv.AdwWidget;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwWidget = $val;
        self.prop_set('extra-child', $gv);
      }
    );
  }

  # Type: string
  method heading is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('heading', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('heading', $gv);
      }
    );
  }

  # Type: boolean
  method heading-use-markup is rw  is g-property is also<heading_use_markup> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('heading-use-markup', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('heading-use-markup', $gv);
      }
    );
  }

  method Response {
    self.connect-string($!adw-al-d, 'response');
  }

  method add_response (Str() $id, Str() $label) is also<add-response> {
    adw_alert_dialog_add_response($!adw-al-d, $id, $label);
  }

  # method add_responses (
  #   Str            $first_id
  # ) {
  #   adw_alert_dialog_add_responses($!adw-al-d, $first_id);
  # }

  multi method choose (
                    &callback,
    gpointer        $user_data     = gpointer,
    GtkWidget()    :$parent        = GtkWidget,
    GCancellable() :$cancellable   = GCancellable
  ) {
    samewith($parent, $cancellable, &callback, $user_data);
  }
  multi method choose (
    GtkWidget()    $parent,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data     = gpointer
  ) {
    adw_alert_dialog_choose(
      $!adw-al-d,
      $parent,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method choose_finish (GAsyncResult() $result) is also<choose-finish> {
    adw_alert_dialog_choose_finish($!adw-al-d, $result);
  }

  method format_body (Str() $format) is also<format-body> {
    adw_alert_dialog_format_body($!adw-al-d, $format, Str);
  }

  method format_body_markup (Str() $format) is also<format-body-markup> {
    adw_alert_dialog_format_body_markup($!adw-al-d, $format, Str);
  }

  method format_heading (Str() $format) is also<format-heading> {
    adw_alert_dialog_format_heading($!adw-al-d, $format, Str);
  }

  method format_heading_markup (Str() $format) is also<format-heading-markup> {
    adw_alert_dialog_format_heading_markup($!adw-al-d, $format, Str);
  }

  method get_body is also<get-body> {
    adw_alert_dialog_get_body($!adw-al-d);
  }

  method get_body_use_markup is also<get-body-use-markup> {
    so adw_alert_dialog_get_body_use_markup($!adw-al-d);
  }

  method get_close_response is also<get-close-response> {
    adw_alert_dialog_get_close_response($!adw-al-d);
  }

  method get_default_response is also<get-default-response> {
    adw_alert_dialog_get_default_response($!adw-al-d);
  }

  method get_extra_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :proper(:$slow) = $fast.not
  )
    is also<get-extra-child>
  {
    returnProperWidget(
      adw_alert_dialog_get_extra_child($!adw-al-d),
      $raw,
      $slow
    );
  }

  method get_heading is also<get-heading> {
    adw_alert_dialog_get_heading($!adw-al-d);
  }

  method get_heading_use_markup is also<get-heading-use-markup> {
    adw_alert_dialog_get_heading_use_markup($!adw-al-d);
  }

  method get_response_appearance (Str() $response, :$enum = True)
    is also<get-response-appearance>
  {
    my $a = adw_alert_dialog_get_response_appearance($!adw-al-d, $response);
    return $a unless $enum;
    AdwResponseAppearanceEnum($a);
  }

  method get_response_enabled (Str() $response) is also<get-response-enabled> {
    adw_alert_dialog_get_response_enabled($!adw-al-d, $response);
  }

  method get_response_label (Str() $response) is also<get-response-label> {
    adw_alert_dialog_get_response_label($!adw-al-d, $response);
  }

  method has_response (Str() $response) is also<has-response> {
    adw_alert_dialog_has_response($!adw-al-d, $response);
  }

  method remove_response (Str() $id) is also<remove-response> {
    adw_alert_dialog_remove_response($!adw-al-d, $id);
  }

  method set_body (Str() $body) is also<set-body> {
    adw_alert_dialog_set_body($!adw-al-d, $body);
  }

  method set_body_use_markup (Int() $use_markup) is also<set-body-use-markup> {
    my gboolean $u = $use_markup.so.Int;

    adw_alert_dialog_set_body_use_markup($!adw-al-d, $u);
  }

  method set_close_response (Str() $response) is also<set-close-response> {
    adw_alert_dialog_set_close_response($!adw-al-d, $response);
  }

  method set_default_response (Str() $response) is also<set-default-response> {
    adw_alert_dialog_set_default_response($!adw-al-d, $response);
  }

  method set_extra_child (GtkWidget() $child) is also<set-extra-child> {
    adw_alert_dialog_set_extra_child($!adw-al-d, $child);
  }

  method set_heading (Str() $heading) is also<set-heading> {
    adw_alert_dialog_set_heading($!adw-al-d, $heading);
  }

  method set_heading_use_markup (Int() $use_markup)
    is also<set-heading-use-markup>
  {
    my gboolean $u = $use_markup.so.Int;

    adw_alert_dialog_set_heading_use_markup($!adw-al-d, $u);
  }

  method set_response_appearance (Str() $response, Int() $appearance)
    is also<set-response-appearance>
  {
    my AdwResponseAppearance $a = $appearance;

    adw_alert_dialog_set_response_appearance($!adw-al-d, $response, $a);
  }

  method set_response_enabled (Str() $response, Int() $enabled)
    is also<set-response-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    adw_alert_dialog_set_response_enabled($!adw-al-d, $response, $e);
  }

  method set_response_label (Str() $response, Str() $label)
    is also<set-response-label>
  {
    adw_alert_dialog_set_response_label($!adw-al-d, $response, $label);
  }

}
