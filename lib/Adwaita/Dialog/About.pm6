use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Dialog::About;

use Adwaita::Dialog;

use GLib::Roles::Implementor;

our subset AdwAboutDialogAncestry is export of Mu
  where AdwAboutDialog | AdwDialogAncestry;

class Adwaita::Dialog::About is Adwaita::Dialog {
  has AdwAboutDialog $!adw-ab-d is implementor;

  submethod BUILD ( :$adw-about-dlg ) {
    self.setAdwAboutDialog($adw-about-dlg) if $adw-about-dlg
  }

  method setAdwAboutDialog (AdwAboutDialogAncestry $_) {
    my $to-parent;

    $!adw-ab-d = do {
      when AdwAboutDialog {
        $to-parent = cast(AdwDialog, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwAboutDialog, $_);
      }
    }
    self.setAdwDialog($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwAboutDialog
  { $!adw-ab-d }

  multi method new (
     $adw-about-dlg where * ~~ AdwAboutDialogAncestry,

    :$ref                                              = True
  ) {
    return unless $adw-about-dlg;

    my $o = self.bless( :$adw-about-dlg );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $adw-about-dlg = adw_about_dialog_new();

    $adw-about-dlg ?? self.bless( :$adw-about-dlg ) !! Nil;
  }

  method new_from_appdata (
    Str() $resource_path,
    Str() $release_notes_version
  ) {
    my $adw-about-dlg = adw_about_dialog_new_from_appdata(
      $resource_path,
      $release_notes_version
    );

    $adw-about-dlg ?? self.bless( :$adw-about-dlg ) !! Nil;
  }

  # Type: string
  method application-icon is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('application-icon', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('application-icon', $gv);
      }
    );
  }

  # Type: string
  method application-name is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('application-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('application-name', $gv);
      }
    );
  }

  # Type: GStrv
  method artists ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('artists', $gv);
        my $ca = cast(CArray[Str], $gv.pointer);
        return $ca if $raw;
        CArrayToArray($ca);
      },
      STORE => -> $,  $val is copy {
        $val = do given $val {
          when Array             { ArrayToCArray($val, :null) }
          when CArray | gpointer { $_ }
        }
        $gv.pointer = $val;
      }
    );
  }

  # Type: string
  method comments is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('comments', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('comments', $gv);
      }
    );
  }

  # Type: string
  method copyright is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('copyright', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('copyright', $gv);
      }
    );
  }

  # Type: string
  method debug-info is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('debug-info', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('debug-info', $gv);
      }
    );
  }

  # Type: string
  method debug-info-filename is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('debug-info-filename', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('debug-info-filename', $gv);
      }
    );
  }

  # Type: GStrv
  method designers ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('designers', $gv);
        my $ca = cast(CArray[Str], $gv.pointer);
        return $ca if $raw;
        CArrayToArray($ca);
      },
      STORE => -> $, $val is copy {
        $val = do given $val {
          when Array             { ArrayToCArray($val, :null) }
          when CArray | gpointer { $_ }
        }

        $gv.pointer = $val;
        self.prop_set('designers', $gv);
      }
    );
  }

  # Type: string
  method developer-name is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('developer-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('developer-name', $gv);
      }
    );
  }

  # Type: GStrv
  method developers ( :$raw = False )  is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('developers', $gv);
        my $ca = cast(CArray[Str], $gv.pointer);
        return $ca if $raw;
        CArrayToArray($ca);
      },
      STORE => -> $,  $val is copy {
        $val = do given $val {
          when Array             { ArrayToCArray($val, :null) }
          when CArray | gpointer { $_ }
        }

        $gv.pointer = $val;
        self.prop_set('developers', $gv);
      }
    );
  }

  # Type: GStrv
  method documenters ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('documenters', $gv);
        my $ca = cast(CArray[Str], $gv.pointer);
        return $ca if $raw;
        CArrayToArray($ca);
      },
      STORE => -> $,  $val is copy {
        $val = do given $val {
          when Array             { ArrayToCArray($val, :null) }
          when CArray | gpointer { $_ }
        }

        $gv.pointer = $val;
        self.prop_set('documenters', $gv);
      }
    );
  }

  # Type: string
  method issue-url is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('issue-url', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('issue-url', $gv);
      }
    );
  }

  # Type: string
  method license is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('license', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('license', $gv);
      }
    );
  }

  # Type: GtkLicense
  method license-type ( :$enum = True ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::Enums::License.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('license-type', $gv);
        my $l = $gv.enum;
        return $l unless $enum;
        GtkLicenseEnum($l);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GtkLicense) = $val;
        self.prop_set('license-type', $gv);
      }
    );
  }

  # Type: string
  method release-notes is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('release-notes', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('release-notes', $gv);
      }
    );
  }

  # Type: string
  method release-notes-version is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('release-notes-version', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('release-notes-version', $gv);
      }
    );
  }

  # Type: string
  method support-url is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('support-url', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('support-url', $gv);
      }
    );
  }

  # Type: string
  method translator-credits is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('translator-credits', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('translator-credits', $gv);
      }
    );
  }

  # Type: string
  method version is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('version', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('version', $gv);
      }
    );
  }

  # Type: string
  method website is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('website', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('website', $gv);
      }
    );
  }

  method Activate-Link {
    self.connect-string-rbool($!adw-ab-d, 'activate-link');
  }

  proto method add_acknowledgement_section (|)
  { * }

  multi method add_acknowledgement_section (Str() $name, @people) {
    samewith( $name, ArrayToCArray(Str, @people) );
  }
  multi method add_acknowledgement_section (Str() $name, CArray[Str] $people) {
    adw_about_dialog_add_acknowledgement_section($!adw-ab-d, $name, $people);
  }

  proto method add_credit_section (|)
  { * }

  multi method add_credit_section (Str() $name, @people) {
    samewith( $name, ArrayToCArray(Str, @people) );
  }
  multi method add_credit_section (Str() $name, CArray[Str] $people) {
    adw_about_dialog_add_credit_section($!adw-ab-d, $name, $people);
  }

  method add_legal_section (
    Str() $title,
    Str() $copyright,
    Int() $license_type,
    Str() $license
  ) {
    my GtkLicense $l = $license_type;

    adw_about_dialog_add_legal_section(
      $!adw-ab-d,
      $title,
      $copyright,
      $license_type,
      $l
    );
  }

  method add_link (Str() $title, Str() $url) {
    adw_about_dialog_add_link($!adw-ab-d, $title, $url);
  }

  method get_application_icon {
    adw_about_dialog_get_application_icon($!adw-ab-d);
  }

  method get_application_name {
    adw_about_dialog_get_application_name($!adw-ab-d);
  }

  method get_artists ( :$raw = False ) {
    my $a = adw_about_dialog_get_artists($!adw-ab-d);
    return $a if $raw;
    CArrayToArray($a);
  }

  method get_comments {
    adw_about_dialog_get_comments($!adw-ab-d);
  }

  method get_copyright {
    adw_about_dialog_get_copyright($!adw-ab-d);
  }

  method get_debug_info {
    adw_about_dialog_get_debug_info($!adw-ab-d);
  }

  method get_debug_info_filename {
    adw_about_dialog_get_debug_info_filename($!adw-ab-d);
  }

  method get_designers ( :$raw = False ) {
    my $d = adw_about_dialog_get_designers($!adw-ab-d);
    return $d if $raw;
    CArrayToArray($d);
  }

  method get_developer_name {
    adw_about_dialog_get_developer_name($!adw-ab-d);
  }

  method get_developers ( :$raw = False ) {
    my $d = adw_about_dialog_get_developers($!adw-ab-d);
    return $d if $raw;
    CArrayToArray($d);
  }

  method get_documenters ( :$raw = False ) {
    my $d = adw_about_dialog_get_documenters($!adw-ab-d);
    return $d if $raw;
    CArrayToArray($d);
  }

  method get_issue_url {
    adw_about_dialog_get_issue_url($!adw-ab-d);
  }

  method get_license {
    adw_about_dialog_get_license($!adw-ab-d);
  }

  method get_license_type ( :$enum = True )  {
    my $l = adw_about_dialog_get_license_type($!adw-ab-d);
    return $l unless $enum;
    GtkLicenseEnum($l);
  }

  method get_release_notes {
    adw_about_dialog_get_release_notes($!adw-ab-d);
  }

  method get_release_notes_version {
    adw_about_dialog_get_release_notes_version($!adw-ab-d);
  }

  method get_support_url {
    adw_about_dialog_get_support_url($!adw-ab-d);
  }

  method get_translator_credits {
    adw_about_dialog_get_translator_credits($!adw-ab-d);
  }

  method get_version {
    adw_about_dialog_get_version($!adw-ab-d);
  }

  method get_website {
    adw_about_dialog_get_website($!adw-ab-d);
  }

  method set_application_icon (Str() $application_icon) {
    adw_about_dialog_set_application_icon($!adw-ab-d, $application_icon);
  }

  method set_application_name (Str() $application_name) {
    adw_about_dialog_set_application_name($!adw-ab-d, $application_name);
  }

  proto method set_artists (|)
  { * }

  multi method set_artists ( @artists ) {
    samewith( ArrayToCArray(Str, @artists) )
  }
  multi method set_artists (CArray[Str] $artists) {
    adw_about_dialog_set_artists($!adw-ab-d, $artists);
  }

  method set_comments (Str() $comments) {
    adw_about_dialog_set_comments($!adw-ab-d, $comments);
  }

  method set_copyright (Str() $copyright) {
    adw_about_dialog_set_copyright($!adw-ab-d, $copyright);
  }

  method set_debug_info (Str() $debug_info) {
    adw_about_dialog_set_debug_info($!adw-ab-d, $debug_info);
  }

  method set_debug_info_filename (Str() $filename) {
    adw_about_dialog_set_debug_info_filename($!adw-ab-d, $filename);
  }

  proto method set_designers (|)
  { * }

  multi method set_designers ( @artists ) {
    samewith( ArrayToCArray(Str, @artists) )
  }
  multi method set_designers (CArray[Str] $designers) {
    adw_about_dialog_set_designers($!adw-ab-d, $designers);
  }

  method set_developer_name (Str() $developer_name) {
    adw_about_dialog_set_developer_name($!adw-ab-d, $developer_name);
  }

  proto method set_developers (|)
  { * }

  multi method set_developers ( @artists ) {
    samewith( ArrayToCArray(Str, @artists) )
  }
  multi method set_developers (CArray[Str] $developers) {
    adw_about_dialog_set_developers($!adw-ab-d, $developers);
  }

  proto method set_documenters (|)
  { * }

  multi method set_documenters ( @artists ) {
    samewith( ArrayToCArray(Str, @artists) )
  }
  multi method set_documenters (CArray[Str] $documenters) {
    adw_about_dialog_set_documenters($!adw-ab-d, $documenters);
  }

  method set_issue_url (Str() $issue_url) {
    adw_about_dialog_set_issue_url($!adw-ab-d, $issue_url);
  }

  method set_license (Str() $license) {
    adw_about_dialog_set_license($!adw-ab-d, $license);
  }

  method set_license_type (GtkLicense() $license_type) {
    adw_about_dialog_set_license_type($!adw-ab-d, $license_type);
  }

  method set_release_notes (Str() $release_notes) {
    adw_about_dialog_set_release_notes($!adw-ab-d, $release_notes);
  }

  method set_release_notes_version (Str() $version) {
    adw_about_dialog_set_release_notes_version($!adw-ab-d, $version);
  }

  method set_support_url (Str() $support_url) {
    adw_about_dialog_set_support_url($!adw-ab-d, $support_url);
  }

  method set_translator_credits (Str() $translator_credits) {
    adw_about_dialog_set_translator_credits($!adw-ab-d, $translator_credits);
  }

  method set_version (Str() $version) {
    adw_about_dialog_set_version($!adw-ab-d, $version);
  }

  method set_website (Str() $website) {
    adw_about_dialog_set_website($!adw-ab-d, $website);
  }

}
