use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Avatar;

use GDK::Texture:ver<4>;
use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;
use GDK::Roles::Paintable:ver<4>;

our subset AdwAvatarAncestry is export of Mu
  where AdwAvatar | GtkWidgetAncestry;

class Adwaita::Avatar is GTK::Widget:ver<4> {
  has AdwAvatar $!adw-a is implementor;

  submethod BUILD ( :$adw-avatar ) {
    self.setAdwAvatar($adw-avatar) if $adw-avatar
  }

  method setAdwAvatar (AdwAvatarAncestry $_) {
    my $to-parent;

    $!adw-a = do {
      when AdwAvatar {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwAvatar, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwAvatar
    is also<AdwAvatar>
  { $!adw-a }

  multi method new (
    $adw-avatar where * ~~ AdwAvatarAncestry,

    :$ref = True
  ) {
    return unless $adw-avatar;

    my $o = self.bless( :$adw-avatar );
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $size, Str() $text, Int() $show_initials, *%a) {
    my gint     $s  = $size;
    my gboolean $si = $show_initials.so.Int;

    my $adw-avatar = adw_avatar_new($s, $text, $si);

    my $o = $adw-avatar ?? self.bless( :$adw-avatar ) !! Nil;
    $o.setAttributes(%a) if $o && %a;;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-avatar = ::?CLASS.new-object-ptr( ::?CLASS.get_type );

    my $o = $adw-avatar ?? self.bless( :$adw-avatar ) !! Nil;
    $o.setAttributes(%a) if $o && %a;;
    $o;
  }

  # Type: GdkPaintable
  method custom-image ( :$raw = False )
    is rw
    is g-property
    is also<custom_image>
  {
    my $gv = GLib::Value.new( GDK::Paintable.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('custom-image', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GDK::Paintable.getTypePair
        );
      },
      STORE => -> $, GdkPaintable() $val is copy {
        $gv.object = $val;
        self.prop_set('custom-image', $gv);
      }
    );
  }

  # Type: string
  method icon-name is rw  is g-property is also<icon_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('icon-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('icon-name', $gv);
      }
    );
  }

  # Type: boolean
  method show-initials is rw  is g-property is also<show_initials> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-initials', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-initials', $gv);
      }
    );
  }

  # Type: int
  method size is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('size', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('size', $gv);
      }
    );
  }

  # Type: string
  method text is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('text', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('text', $gv);
      }
    );
  }

  method unsetCustomImage {
    self.custom-image = GdkPaintable;
  }

  method draw_to_texture (
    Int()  $scale_factor = self.scale_factor,
          :$raw          = False
  )
    is also<draw-to-texture>
  {
    my gint $s = $scale_factor;

    propReturnObject(
      adw_avatar_draw_to_texture($!adw-a, $s),
      $raw,
      |GDK::Texture.getTypePair
    );
  }

  method get_custom_image ( :$raw = False ) is also<get-custom-image> {
    propReturnObject(
      adw_avatar_get_custom_image($!adw-a),
      $raw,
      |GDK::Paintable.getTypePair
    );
  }

  method get_icon_name is also<get-icon-name> {
    adw_avatar_get_icon_name($!adw-a);
  }

  method get_show_initials is also<get-show-initials> {
    so adw_avatar_get_show_initials($!adw-a);
  }

  method get_size is also<get-size> {
    adw_avatar_get_size($!adw-a);
  }

  method get_text is also<get-text> {
    adw_avatar_get_text($!adw-a);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_avatar_get_type, $n, $t );
  }

  method set_custom_image (GdkPaintable() $custom_image)
    is also<set-custom-image>
  {
    adw_avatar_set_custom_image($!adw-a, $custom_image);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    adw_avatar_set_icon_name($!adw-a, $icon_name);
  }

  method set_show_initials (Int() $show_initials)
    is also<set-show-initials>
  {
    my gboolean $s = $show_initials.so.Int;

    adw_avatar_set_show_initials($!adw-a, $s);
  }

  method set_size (Int() $size) is also<set-size> {
    my gint $s = $size;

    adw_avatar_set_size($!adw-a, $s);
  }

  method set_text (Str() $text) is also<set-text> {
    adw_avatar_set_text($!adw-a, $text);
  }

}
