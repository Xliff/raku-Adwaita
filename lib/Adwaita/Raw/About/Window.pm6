use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Enums:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::About::Window;

### /usr/src/libadwaita-1-1.2.0/src/adw-about-window.h

sub adw_about_window_add_acknowledgement_section (
  AdwAboutWindow $self,
  Str            $name,
  CArray[Str]    $people
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_add_credit_section (
  AdwAboutWindow $self,
  Str            $name,
  CArray[Str]    $people
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_add_legal_section (
  AdwAboutWindow $self,
  Str            $title,
  Str            $copyright,
  GtkLicense     $license_type,
  Str            $license
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_add_link (
  AdwAboutWindow $self,
  Str            $title,
  Str            $url
)
  is      native(gtk4)
  is      export
{ * }

sub adw_show_about_window (
  GtkWindow $parent,
  Str       $first_property_name
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_application_icon (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_application_name (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_artists (AdwAboutWindow $self)
  returns constcharconst
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_comments (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_copyright (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_debug_info (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_debug_info_filename (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_designers (AdwAboutWindow $self)
  returns constcharconst
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_developer_name (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_developers (AdwAboutWindow $self)
  returns constcharconst
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_documenters (AdwAboutWindow $self)
  returns constcharconst
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_issue_url (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_license (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_license_type (AdwAboutWindow $self)
  returns GtkLicense
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_release_notes (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_release_notes_version (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_support_url (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_translator_credits (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_version (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_get_website (AdwAboutWindow $self)
  returns Str
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_new
  returns GtkWidget
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_application_icon (
  AdwAboutWindow $self,
  Str            $application_icon
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_application_name (
  AdwAboutWindow $self,
  Str            $application_name
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_artists (
  AdwAboutWindow $self,
  CArray[Str]    $artists
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_comments (
  AdwAboutWindow $self,
  Str            $comments
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_copyright (
  AdwAboutWindow $self,
  Str            $copyright
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_debug_info (
  AdwAboutWindow $self,
  Str            $debug_info
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_debug_info_filename (
  AdwAboutWindow $self,
  Str            $filename
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_designers (
  AdwAboutWindow $self,
  CArray[Str]    $designers
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_developer_name (
  AdwAboutWindow $self,
  Str            $developer_name
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_developers (
  AdwAboutWindow $self,
  CArray[Str]    $developers
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_documenters (
  AdwAboutWindow $self,
  CArray[Str]    $documenters
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_issue_url (
  AdwAboutWindow $self,
  Str            $issue_url
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_license (
  AdwAboutWindow $self,
  Str            $license
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_license_type (
  AdwAboutWindow $self,
  GtkLicense     $license_type
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_release_notes (
  AdwAboutWindow $self,
  Str            $release_notes
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_release_notes_version (
  AdwAboutWindow $self,
  Str            $version
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_support_url (
  AdwAboutWindow $self,
  Str            $support_url
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_translator_credits (
  AdwAboutWindow $self,
  Str            $translator_credits
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_version (
  AdwAboutWindow $self,
  Str            $version
)
  is      native(gtk4)
  is      export
{ * }

sub adw_about_window_set_website (
  AdwAboutWindow $self,
  Str            $website
)
  is      native(gtk4)
  is      export
{ * }
