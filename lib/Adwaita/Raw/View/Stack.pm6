use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;
use Adwaita::Raw::Enums;

unit package Adwaita::Raw::View::Stack;

### /usr/src/libadwaita-1-1.3~alpha/src/adw-view-stack.h

sub adw_view_stack_add (
  AdwViewStack $self,
  GtkWidget    $child
)
  returns AdwViewStackPage
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_add_named (
  AdwViewStack $self,
  GtkWidget    $child,
  Str          $name
)
  returns AdwViewStackPage
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_add_titled (
  AdwViewStack $self,
  GtkWidget    $child,
  Str          $name,
  Str          $title
)
  returns AdwViewStackPage
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_add_titled_with_icon (
  AdwViewStack $self,
  GtkWidget    $child,
  Str          $name,
  Str          $title,
  Str          $icon_name
)
  returns AdwViewStackPage
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_get_child_by_name (
  AdwViewStack $self,
  Str          $name
)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_get_hhomogeneous (AdwViewStack $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_get_page (
  AdwViewStack $self,
  GtkWidget    $child
)
  returns AdwViewStackPage
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_get_pages (AdwViewStack $self)
  returns GtkSelectionModel
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_get_vhomogeneous (AdwViewStack $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_get_visible_child (AdwViewStack $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_get_visible_child_name (AdwViewStack $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_new
  returns AdwViewStack
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_badge_number (AdwViewStackPage $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_child (AdwViewStackPage $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_icon_name (AdwViewStackPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_name (AdwViewStackPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_needs_attention (AdwViewStackPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_title (AdwViewStackPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_use_underline (AdwViewStackPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_get_visible (AdwViewStackPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_set_badge_number (
  AdwViewStackPage $self,
  guint            $badge_number
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_set_icon_name (
  AdwViewStackPage $self,
  Str              $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_set_name (
  AdwViewStackPage $self,
  Str              $name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_set_needs_attention (
  AdwViewStackPage $self,
  gboolean         $needs_attention
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_set_title (
  AdwViewStackPage $self,
  Str              $title
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_set_use_underline (
  AdwViewStackPage $self,
  gboolean         $use_underline
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_page_set_visible (
  AdwViewStackPage $self,
  gboolean         $visible
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_remove (
  AdwViewStack $self,
  GtkWidget    $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_set_hhomogeneous (
  AdwViewStack $self,
  gboolean     $hhomogeneous
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_set_vhomogeneous (
  AdwViewStack $self,
  gboolean     $vhomogeneous
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_set_visible_child (
  AdwViewStack $self,
  GtkWidget    $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_stack_set_visible_child_name (
  AdwViewStack $self,
  Str          $name
)
  is      native(adwaita)
  is      export
{ * }
