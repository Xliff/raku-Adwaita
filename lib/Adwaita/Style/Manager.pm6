use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Style::Manager;

use GLib::Roles::Implementor;
use GLib::Roles::Object;


our subset AdwStyleManagerAncestry is export of Mu
  where AdwStyleManager | GObject;

class Adwaita::Style::Manager {
  also does GLib::Roles::Object;

  has AdwStyleManager $!adw-sm is implementor;

  submethod BUILD ( :$adw-style-manager ) {
    self.setAdwStyleManager($adw-style-manager) if $adw-style-manager
  }

  method setAdwStyleManager (AdwStyleManagerAncestry $_) {
    my $to-parent;

    $!adw-sm = do {
      when AdwStyleManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwStyleManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwStyleManager
    is also<AdwStyleManager>
  { $!adw-sm }

  multi method new (
    $adw-style-manager where * ~~ AdwStyleManagerAncestry,

    :$ref = True
  ) {
    return unless $adw-style-manager;

    my $o = self.bless( :$adw-style-manager );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $o = ::?CLASS.get_default();
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  method new-for-display (GdkDisplay() $display, *%a) {
    my $o = ::?CLASS.get_for_display($display);
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  method get_default is also<get-default> is static {
    my $adw-style-manager = adw_style_manager_get_default();

    $adw-style-manager ?? self.bless( :$adw-style-manager ) !! Nil;
  }

  method get_for_display (GdkDisplay() $display) is also<get-for-display> {
    my $adw-style-manager = adw_style_manager_get_for_display($display);

    $adw-style-manager ?? self.bless( :$adw-style-manager ) !! Nil;
  }


  # Type: AdwColorScheme
  method color-scheme ( :$enum = True ) is rw  is g-property {
    my $gv = GLib::Value.new-enum( AdwColorScheme );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('color-scheme', $gv);
        my $c = $gv.enum;
        return $c unless $enum;
        AdwColorSchemeEnum($c);
      },
      STORE => -> $,  Int() $val is copy {
        $gv.valueFromEnum(AdwColorScheme) = $val;
        self.prop_set('color-scheme', $gv);
      }
    );
  }

  # Type: boolean
  method dark is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('dark', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'dark does not allow writing'
      }
    );
  }

  # Type: GdkDisplay
  method display ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GDK::Display.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('display', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GDK::Display.getTypePair
        );
      },
      STORE => -> $, GdkDisplay() $val is copy {
        $gv.object = $val;
        self.prop_set('display', $gv);
      }
    );
  }

  # Type: boolean
  method high-contrast is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('high-contrast', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'high-contrast does not allow writing'
      }
    );
  }

  # Type: boolean
  method system-supports-color-schemes is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('system-supports-color-schemes', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'system-supports-color-schemes does not allow writing'
      }
    );
  }

  method get_color_scheme ( :$enum = True ) is also<get-color-scheme> {
    my $c = adw_style_manager_get_color_scheme($!adw-sm);
    return $c unless $enum;
    AdwColorSchemeEnum($c);
  }

  method get_dark is also<get-dark> {
    so adw_style_manager_get_dark($!adw-sm);
  }

  method get_display ( :$raw = False ) is also<get-display> {
    propReturnObject(
      adw_style_manager_get_display($!adw-sm),
      $raw,
      |GDK::Display.getTypePair
    );
  }

  method get_high_contrast is also<get-high-contrast> {
    so adw_style_manager_get_high_contrast($!adw-sm);
  }

  method get_system_supports_color_schemes
    is also<get-system-supports-color-schemes>
  {
    so adw_style_manager_get_system_supports_color_schemes($!adw-sm);
  }

  method set_color_scheme (Int() $color_scheme) is also<set-color-scheme> {
    my AdwColorScheme $c = $color_scheme;

    adw_style_manager_set_color_scheme($!adw-sm, $c);
  }

}
