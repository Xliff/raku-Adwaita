use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Dialog::Message;

use GTK::Window:ver<4>;

use GLib::Roles::Implementor;

our subset AdwMessageDialogAncestry is export of Mu
  where AdwMessageDialog | GtkWindowAncestry;

class Adwaita::Dialog::Message is GTK::Window:ver<4> {
  has AdwMessageDialog $!adw-md is implementor;

  submethod BUILD ( :$adw-message-dialog ) {
    self.setAdwMessageDialog($adw-message-dialog) if $adw-message-dialog;
  }

  method setAdwMessageDialog (AdwMessageDialogAncestry $_) {
    my $to-parent;

    $!adw-md = do {
      when AdwMessageDialog {
        $to-parent = cast(GtkWindow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwMessageDialog, $_);
      }
    }
    self.setGtkWindow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwMessageDialog
    is also<AdwMessageDialog>
  { $!adw-md }

  multi method new (
    $adw-message-dialog where * ~~ AdwMessageDialogAncestry,

    :$ref = True
  ) {
    return unless $adw-message-dialog;

    my $o = self.bless( :$adw-message-dialog );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $heading, Str() $body, *%a) {
    my $adw-message-dialog = adw_message_dialog_new($heading, $body);

    my $o = $adw-message-dialog ?? self.bless( :$adw-message-dialog )
                                !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
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

  # Type: AdwWidget
  method extra-child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<extra_child>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('extra-child', $gv);
        returnProperWidget(
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
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
  method heading-use-markup
    is rw
    is g-property
    is also<heading_use_markup>
  {
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
    self.connect-string($!adw-md, 'response');
  }

  method add_response (Str() $id, Str() $label) is also<add-response> {
    adw_message_dialog_add_response($!adw-md, $id, $label);
  }

  method add_responses (Str() $first_id) is also<add-responses> {
    adw_message_dialog_add_responses($!adw-md, $first_id);
  }

  multi method choose (
                   &callback,
    GCancellable() $cancellable = GCancellable,
    gpointer       $user_data   = gpointer
  ) {
    samewith($cancellable, &callback, $user_data);
  }
  multi method choose (
    GCancellable        $cancellable,
                        &callback,
    gpointer            $user_data    = gpointer
  ) {
    adw_message_dialog_choose($!adw-md, $cancellable, &callback, $user_data);
  }

  method choose_finish (GAsyncResult() $result) is also<choose-finish> {
    adw_message_dialog_choose_finish($!adw-md, $result);
  }

  method format_body (Str() $format) is also<format-body> {
    adw_message_dialog_format_body($!adw-md, $format);
  }

  method format_body_markup (Str() $format) is also<format-body-markup> {
    adw_message_dialog_format_body_markup($!adw-md, $format);
  }

  method format_heading (Str() $format) is also<format-heading> {
    adw_message_dialog_format_heading($!adw-md, $format);
  }

  method format_heading_markup (Str() $format)
    is also<format-heading-markup>
  {
    adw_message_dialog_format_heading_markup($!adw-md, $format);
  }

  method get_body is also<get-body> {
    adw_message_dialog_get_body($!adw-md);
  }

  method get_body_use_markup is also<get-body-use-markup> {
    so adw_message_dialog_get_body_use_markup($!adw-md);
  }

  method get_close_response is also<get-close-response> {
    adw_message_dialog_get_close_response($!adw-md);
  }

  method get_default_response is also<get-default-response> {
    adw_message_dialog_get_default_response($!adw-md);
  }

  method get_extra_child is also<get-extra-child> {
    adw_message_dialog_get_extra_child($!adw-md);
  }

  method get_heading is also<get-heading> {
    adw_message_dialog_get_heading($!adw-md);
  }

  method get_heading_use_markup is also<get-heading-use-markup> {
    so adw_message_dialog_get_heading_use_markup($!adw-md);
  }

  method get_response_appearance (Str() $response)
    is also<get-response-appearance>
  {
    adw_message_dialog_get_response_appearance($!adw-md, $response);
  }

  method get_response_enabled (Str() $response) is also<get-response-enabled> {
    adw_message_dialog_get_response_enabled($!adw-md, $response);
  }

  method get_response_label (Str() $response) is also<get-response-label> {
    adw_message_dialog_get_response_label($!adw-md, $response);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(self.^name, &adw_message_dialog_get_type, $n, $t);
  }

  method has_response (Str() $response) is also<has-response> {
    adw_message_dialog_has_response($!adw-md, $response);
  }

  method response (Str() $response) {
    adw_message_dialog_response($!adw-md, $response);
  }

  method set_body (Str() $body) is also<set-body> {
    adw_message_dialog_set_body($!adw-md, $body);
  }

  method set_body_use_markup (Int() $use_markup)
    is also<set-body-use-markup>
  {
    my gboolean $u = $use_markup.so.Int;

    adw_message_dialog_set_body_use_markup($!adw-md, $u);
  }

  method set_close_response (Str() $response)
    is also<set-close-response>
  {
    adw_message_dialog_set_close_response($!adw-md, $response);
  }

  method set_default_response (Str() $response)
    is also<set-default-response>
  {
    adw_message_dialog_set_default_response($!adw-md, $response);
  }

  method set_extra_child (GtkWidget() $child) is also<set-extra-child> {
    adw_message_dialog_set_extra_child($!adw-md, $child);
  }

  method set_heading (Str() $heading) is also<set-heading> {
    adw_message_dialog_set_heading($!adw-md, $heading);
  }

  method set_heading_use_markup (Int() $use_markup)
    is also<set-heading-use-markup>
  {
    my gboolean $u = $use_markup.so.Int;

    adw_message_dialog_set_heading_use_markup($!adw-md, $u);
  }

  method set_response_appearance (Str() $response, Int() $appearance)
    is also<set-response-appearance>
  {
    my AdwResponseAppearance $a = $appearance;

    adw_message_dialog_set_response_appearance($!adw-md, $response, $a);
  }

  method set_response_enabled (Str() $response, Int() $enabled)
    is also<set-response-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    adw_message_dialog_set_response_enabled($!adw-md, $response, $e);
  }

  method set_response_label (Str() $response, Str() $label)
    is also<set-response-label>
  {
    adw_message_dialog_set_response_label($!adw-md, $response, $label);
  }

}
