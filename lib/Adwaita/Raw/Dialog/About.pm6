use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Enums:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Dialog::About;

### /usr/src/libadwaita/src/adw-about-dialog.h

sub adw_about_dialog_add_acknowledgement_section (
  AdwAboutDialog $self,
  Str            $name,
  CArray[Str]    $people
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_add_credit_section (
  AdwAboutDialog $self,
  Str            $name,
  CArray[Str]    $people
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_add_legal_section (
  AdwAboutDialog $self,
  Str            $title,
  Str            $copyright,
  GtkLicense     $license_type,
  Str            $license
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_add_link (
  AdwAboutDialog $self,
  Str            $title,
  Str            $url
)
  is      native(adwaita)
  is      export
{ * }

sub adw_show_about_dialog (
  GtkWidget $parent,
  Str       $first_property_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_show_about_dialog_from_appdata (
  GtkWidget $parent,
  Str       $resource_path,
  Str       $release_notes_version,
  Str       $first_property_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_application_icon (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_application_name (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_artists (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_comments (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_copyright (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_debug_info (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_debug_info_filename (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_designers (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_developer_name (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_developers (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_documenters (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_issue_url (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_license (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_license_type (AdwAboutDialog $self)
  returns GtkLicense
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_release_notes (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_release_notes_version (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_support_url (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_translator_credits (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_version (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_get_website (AdwAboutDialog $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_new
  returns AdwDialog
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_new_from_appdata (
  Str $resource_path,
  Str $release_notes_version
)
  returns AdwDialog
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_application_icon (
  AdwAboutDialog $self,
  Str            $application_icon
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_application_name (
  AdwAboutDialog $self,
  Str            $application_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_artists (
  AdwAboutDialog $self,
  CArray[Str]    $artists
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_comments (
  AdwAboutDialog $self,
  Str            $comments
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_copyright (
  AdwAboutDialog $self,
  Str            $copyright
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_debug_info (
  AdwAboutDialog $self,
  Str            $debug_info
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_debug_info_filename (
  AdwAboutDialog $self,
  Str            $filename
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_designers (
  AdwAboutDialog $self,
  CArray[Str]    $designers
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_developer_name (
  AdwAboutDialog $self,
  Str            $developer_name
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_developers (
  AdwAboutDialog $self,
  CArray[Str]    $developers
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_documenters (
  AdwAboutDialog $self,
  CArray[Str]    $documenters
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_issue_url (
  AdwAboutDialog $self,
  Str            $issue_url
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_license (
  AdwAboutDialog $self,
  Str            $license
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_license_type (
  AdwAboutDialog $self,
  GtkLicense     $license_type
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_release_notes (
  AdwAboutDialog $self,
  Str            $release_notes
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_release_notes_version (
  AdwAboutDialog $self,
  Str            $version
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_support_url (
  AdwAboutDialog $self,
  Str            $support_url
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_translator_credits (
  AdwAboutDialog $self,
  Str            $translator_credits
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_version (
  AdwAboutDialog $self,
  Str            $version
)
  is      native(adwaita)
  is      export
{ * }

sub adw_about_dialog_set_website (
  AdwAboutDialog $self,
  Str            $website
)
  is      native(adwaita)
  is      export
{ * }
