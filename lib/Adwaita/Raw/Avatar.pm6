use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GDK::Raw::Definitions;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::Avatar;

### /usr/src/libadwaita-1-1.2.0/src/adw-avatar.h

sub adw_avatar_draw_to_texture (
  AdwAvatar $self,
  gint      $scale_factor
)
  returns GdkTexture
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_get_custom_image (AdwAvatar $self)
  returns GdkPaintable
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_get_icon_name (AdwAvatar $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_get_show_initials (AdwAvatar $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_get_size (AdwAvatar $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_get_text (AdwAvatar $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_new (
  gint     $size,
  Str      $text,
  gboolean $show_initials
)
  returns AdwAvatar
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_set_custom_image (
  AdwAvatar    $self,
  GdkPaintable $custom_image
)
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_set_icon_name (
  AdwAvatar $self,
  Str       $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_set_show_initials (
  AdwAvatar $self,
  gboolean  $show_initials
)
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_set_size (
  AdwAvatar $self,
  gint      $size
)
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_set_text (
  AdwAvatar $self,
  Str       $text
)
  is      native(adwaita)
  is      export
{ * }

sub adw_avatar_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
