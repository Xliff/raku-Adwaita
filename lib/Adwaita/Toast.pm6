use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Toast;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AdwToastAncestry is export of Mu
  where AdwToast | GObject;

class Adwaita::Toast {
  also does GLib::Roles::Object;

  has AdwToast $!adw-t is implementor;

  submethod BUILD ( :$adw-toast ) {
    self.setAdwToast($adw-toast) if $adw-toast
  }

  method setAdwToast (AdwToastAncestry $_) {
    my $to-parent;

    $!adw-t = do {
      when AdwToast {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwToast, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwToast
    is also<AdwToast>
  { $!adw-t }

  multi method new ($adw-toast where * ~~ AdwToastAncestry, :$ref = True) {
    return unless $adw-toast;

    my $o = self.bless( :$adw-toast );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $title, *%a ) {
    my $adw-toast = adw_toast_new($title);

    my $o = $adw-toast ?? self.bless( :$adw-toast ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # cw: Would confuse the dispatcher if included...
  # method new_format (Str() $format, *%a) {
  #   my $adw-toast = adw_toast_new_format($!adw-t, $format, Str);
  #
  #   my $o = $adw-toast ?? self.bless( :$adw-toast ) !! Nil;
  #   $o.setAttributes(%a) if $o && +%a;
  #   $o;
  # }

  # Type: string
  method action-name is rw  is g-property
    is also<new-format>
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('action-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('action-name', $gv);
      }
    );
  }

  # Type: AdwTypeAny
  method action-target ( :$raw = False )
    is rw
    is g-property
    is also<action_target>
  {
    my $gv = GLib::Value.new( GLib::Variant.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('action-target', $gv);
        propReturnObject(
          $gv.boxed,
          $raw,
          |GLib::Variant.getTypePair
        );
      },
      STORE => -> $, GVariant() $val is copy {
        $gv.boxed = $val;
        self.prop_set('action-target', $gv);
      }
    );
  }

  # Type: string
  method button-label is rw  is g-property is also<button_label> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('button-label', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('button-label', $gv);
      }
    );
  }

  # Type: AdwWidget
  method custom-title (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<custom_title>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('custom-title', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('custom-title', $gv);
      }
    );
  }

  # Type: AdwToastPriority
  method priority ( :$enum = True ) is rw  is g-property {
    my $gv = GLib::Value.new-enum( AdwToastPriority );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('priority', $gv);
        my $p = $gv.enum;
        return $p unless $enum;
        AdwToastPriorityEnum($p);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(AdwToastPriority) = $val;
        self.prop_set('priority', $gv);
      }
    );
  }

  # Type: uint
  method timeout is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('timeout', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('timeout', $gv);
      }
    );
  }

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

  method dismiss {
    adw_toast_dismiss($!adw-t);
  }

  method get_action_name is also<get-action-name> {
    adw_toast_get_action_name($!adw-t);
  }

  method get_action_target_value is also<get-action-target-value> {
    adw_toast_get_action_target_value($!adw-t);
  }

  method get_button_label is also<get-button-label> {
    adw_toast_get_button_label($!adw-t);
  }

  method get_custom_title (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-custom-title>
  {
    returnProperWidget(
      adw_toast_get_custom_title($!adw-t),
      $raw,
      $proper
    );
  }

  method get_priority ( $enum = True ) is also<get-priority> {
    my $p = adw_toast_get_priority($!adw-t);
    return $p unless $enum;
    AdwToastPriorityEnum($p);
  }

  method get_timeout is also<get-timeout> {
    adw_toast_get_timeout($!adw-t);
  }

  method get_title is also<get-title> {
    adw_toast_get_title($!adw-t);
  }

  method set_action_name (Str() $action_name) is also<set-action-name> {
    adw_toast_set_action_name($!adw-t, $action_name);
  }

  method set_action_target (Str() $format_string) is also<set-action-target> {
    adw_toast_set_action_target($!adw-t, $format_string);
  }

  method set_action_target_value (GVariant() $action_target)
    is also<set-action-target-value>
  {
    adw_toast_set_action_target_value($!adw-t, $action_target);
  }

  method set_button_label (Str() $button_label) is also<set-button-label> {
    adw_toast_set_button_label($!adw-t, $button_label);
  }

  method set_custom_title (GtkWidget() $widget) is also<set-custom-title> {
    adw_toast_set_custom_title($!adw-t, $widget);
  }

  method set_detailed_action_name (Str() $detailed_action_name)
    is also<set-detailed-action-name>
  {
    adw_toast_set_detailed_action_name($!adw-t, $detailed_action_name);
  }

  method set_priority (Int() $priority) is also<set-priority> {
    my AdwToastPriority $p = $priority;

    adw_toast_set_priority($!adw-t, $priority);
  }

  method set_timeout (Int() $timeout) is also<set-timeout> {
    my guint $t = $timeout;

    adw_toast_set_timeout($!adw-t, $timeout);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_toast_set_title($!adw-t, $title);
  }

}
