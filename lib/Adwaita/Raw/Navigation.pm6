use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Definitions;

### /usr/src/libadwaita/src/adw-navigation-view.h

sub adw_navigation_view_add (
  AdwNavigationView $self,
  AdwNavigationPage $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_get_can_pop (AdwNavigationPage $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_get_child (AdwNavigationPage $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_get_tag (AdwNavigationPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_get_title (AdwNavigationPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_new (
  GtkWidget $child,
  Str       $title
)
  returns AdwNavigationPage
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_new_with_tag (
  GtkWidget $child,
  Str       $title,
  Str       $tag
)
  returns AdwNavigationPage
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_set_can_pop (
  AdwNavigationPage $self,
  gboolean          $can_pop
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_set_child (
  AdwNavigationPage $self,
  GtkWidget         $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_set_tag (
  AdwNavigationPage $self,
  Str               $tag
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_set_title (
  AdwNavigationPage $self,
  Str               $title
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_find_page (
  AdwNavigationView $self,
  Str               $tag
)
  returns AdwNavigationPage
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_get_animate_transitions (AdwNavigationView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_get_navigation_stack (AdwNavigationView $self)
  returns GListModel
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_get_pop_on_escape (AdwNavigationView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_get_previous_page (
  AdwNavigationView $self,
  AdwNavigationPage $page
)
  returns AdwNavigationPage
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_get_visible_page (AdwNavigationView $self)
  returns AdwNavigationPage
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_pop (AdwNavigationView $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_pop_to_page (
  AdwNavigationView $self,
  AdwNavigationPage $page
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_pop_to_tag (
  AdwNavigationView $self,
  Str               $tag
)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_push (
  AdwNavigationView $self,
  AdwNavigationPage $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_push_by_tag (
  AdwNavigationView $self,
  Str               $tag
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_remove (
  AdwNavigationView $self,
  AdwNavigationPage $page
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_replace (
  AdwNavigationView         $self,
  CArray[AdwNavigationPage] $pages,
  gint                      $n_pages
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_replace_with_tags (
  AdwNavigationView $self,
  CArray[Str]       $tags,
  gint              $n_tags
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_set_animate_transitions (
  AdwNavigationView $self,
  gboolean          $animate_transitions
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_set_pop_on_escape (
  AdwNavigationView $self,
  gboolean          $pop_on_escape
)
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_page_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }

sub adw_navigation_view_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }
