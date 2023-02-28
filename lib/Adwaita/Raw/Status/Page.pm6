use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GDK::Raw::Definitions:ver<4>;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package ADW::Raw::Status::Page;

### /usr/src/libadwaita-1-1.2.0/src/adw-status-page.h

sub adw_status_page_get_child (AdwStatusPage $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_get_description (AdwStatusPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_get_icon_name (AdwStatusPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_get_paintable (AdwStatusPage $self)
  returns GdkPaintable
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_get_title (AdwStatusPage $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_new
  returns AdwStatusPage
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_set_child (
  AdwStatusPage $self,
  GtkWidget     $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_set_description (
  AdwStatusPage $self,
  Str           $description
)
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_set_icon_name (
  AdwStatusPage $self,
  Str           $icon_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_set_paintable (
  AdwStatusPage $self,
  GdkPaintable  $paintable
)
  is      native(adwaita)
  is      export
{ * }

sub adw_status_page_set_title (
  AdwStatusPage $self,
  Str           $title
)
  is      native(adwaita)
  is      export
{ * }
