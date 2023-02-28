use v6.c;

use Method::Also;

use GLib::Raw::Traits;

use Adwaita::Raw::Types;
use Adwaita::Raw::About::Window;

use Adwaita::Window;

use GLib::Roles::Implementor;

our subset AdwAboutWindowAncestry is export of Mu
  where AdwAboutWindow | AdwWindowAncestry;

class Adwaita::About::Window is Adwaita::Window {
  has AdwAboutWindow $!adw-aw is implementor;

  submethod BUILD ( :$adwaita-about-window ) {
    self.setAdwAboutWindow($adwaita-about-window) if $adwaita-about-window
  }

  method setAdwAboutWindow (AdwAboutWindowAncestry $_) {
    my $to-parent;

    $!adw-aw = do {
      when AdwAboutWindow {
        $to-parent = cast(AdwWindow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwAboutWindow, $_);
      }
    }
    self.setAdwWindow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwAboutWindow
    is also<AdwAboutWindow>
  { $!adw-aw }

  multi method new (
    $adwaita-about-window where * ~~ AdwAboutWindowAncestry,

    :$ref = True
  ) {
    return unless $adwaita-about-window;

    my $o = self.bless( :$adwaita-about-window );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adwaita-about-window = adw_about_window_new();

    my $o = $adwaita-about-window ?? self.bless( :$adwaita-about-window )
                                  !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: string
  method application-icon is rw  is g-property is also<application_icon> {
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
  method application-name is rw  is g-property is also<application_name> {
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

  # Type: AdwStrv
  method artists is rw  is g-property {
    my $gv = GLib::Value.new( AdwStrv );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('artists', $gv);
        $gv.AdwStrv;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwStrv = $val;
        self.prop_set('artists', $gv);
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
  method debug-info is rw  is g-property is also<debug_info> {
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
  method debug-info-filename
    is rw
    is g-property
    is also<debug_info_filename>
  {
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

  # Type: AdwStrv
  method designers is rw  is g-property {
    my $gv = GLib::Value.new( AdwStrv );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('designers', $gv);
        $gv.AdwStrv;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwStrv = $val;
        self.prop_set('designers', $gv);
      }
    );
  }

  # Type: string
  method developer-name is rw  is g-property is also<developer_name> {
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

  # Type: AdwStrv
  method developers is rw  is g-property {
    my $gv = GLib::Value.new( AdwStrv );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('developers', $gv);
        $gv.AdwStrv;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwStrv = $val;
        self.prop_set('developers', $gv);
      }
    );
  }

  # Type: AdwStrv
  method documenters is rw  is g-property {
    my $gv = GLib::Value.new( AdwStrv );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('documenters', $gv);
        $gv.AdwStrv;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwStrv = $val;
        self.prop_set('documenters', $gv);
      }
    );
  }

  # Type: string
  method issue-url is rw  is g-property is also<issue_url> {
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

  # Type: AdwLicense
  method license-type is rw  is g-property is also<license_type> {
    my $gv = GLib::Value.new( AdwLicense );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('license-type', $gv);
        $gv.AdwLicense;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwLicense = $val;
        self.prop_set('license-type', $gv);
      }
    );
  }

  # Type: string
  method release-notes is rw  is g-property is also<release_notes> {
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
  method release-notes-version
    is rw
    is g-property
    is also<release_notes_version>
  {
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
  method support-url is rw  is g-property is also<support_url> {
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
  method translator-credits is rw  is g-property is also<translator_credits> {
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

  method add_acknowledgement_section (
    Str            $name,
    CArray[Str]    $people
  )
    is also<add-acknowledgement-section>
  {
    adw_about_window_add_acknowledgement_section($!aaw, $name, $people);
  }

  method add_credit_section (
    Str            $name,
    CArray[Str]    $people
  )
    is also<add-credit-section>
  {
    adw_about_window_add_credit_section($!aaw, $name, $people);
  }

  method add_legal_section (
    Str() $title,
    Str() $copyright,
    Int() $license_type,
    Str() $license
  )
    is also<add-legal-section>
  {
    my GtkLicense $l = $license_type;

    adw_about_window_add_legal_section(
      $!aaw,
      $title,
      $copyright,
      $l,
      $license
    );
  }

  method add_link (Str() $title,Str() $url) is also<add-link> {
    adw_about_window_add_link($!aaw, $title, $url);
  }

  method get_application_icon is also<get-application-icon> {
    adw_about_window_get_application_icon($!aaw);
  }

  method get_application_name is also<get-application-name> {
    adw_about_window_get_application_name($!aaw);
  }

  method get_artists is also<get-artists> {
    adw_about_window_get_artists($!aaw);
  }

  method get_comments is also<get-comments> {
    adw_about_window_get_comments($!aaw);
  }

  method get_copyright is also<get-copyright> {
    adw_about_window_get_copyright($!aaw);
  }

  method get_debug_info is also<get-debug-info> {
    adw_about_window_get_debug_info($!aaw);
  }

  method get_debug_info_filename is also<get-debug-info-filename> {
    adw_about_window_get_debug_info_filename($!aaw);
  }

  method get_designers is also<get-designers> {
    adw_about_window_get_designers($!aaw);
  }

  method get_developer_name is also<get-developer-name> {
    adw_about_window_get_developer_name($!aaw);
  }

  method get_developers is also<get-developers> {
    adw_about_window_get_developers($!aaw);
  }

  method get_documenters is also<get-documenters> {
    adw_about_window_get_documenters($!aaw);
  }

  method get_issue_url is also<get-issue-url> {
    adw_about_window_get_issue_url($!aaw);
  }

  method get_license is also<get-license> {
    adw_about_window_get_license($!aaw);
  }

  method get_license_type ( :$enum = True ) is also<get-license-type> {
    my $l = adw_about_window_get_license_type($!aaw);
    return $l unless $enum;
    GtkLicenseEnum($l);
  }

  method get_release_notes is also<get-release-notes> {
    adw_about_window_get_release_notes($!aaw);
  }

  method get_release_notes_version is also<get-release-notes-version> {
    adw_about_window_get_release_notes_version($!aaw);
  }

  method get_support_url is also<get-support-url> {
    adw_about_window_get_support_url($!aaw);
  }

  method get_translator_credits is also<get-translator-credits> {
    adw_about_window_get_translator_credits($!aaw);
  }

  method get_version is also<get-version> {
    adw_about_window_get_version($!aaw);
  }

  method get_website is also<get-website> {
    adw_about_window_get_website($!aaw);
  }

  method set_application_icon (Str() $application_icon)
    is also<set-application-icon>
  {
    adw_about_window_set_application_icon($!aaw, $application_icon);
  }

  method set_application_name (Str() $application_name)
    is also<set-application-name>
  {
    adw_about_window_set_application_name($!aaw, $application_name);
  }

  method set_artists (CArray[Str] $artists) is also<set-artists> {
    adw_about_window_set_artists($!aaw, $artists);
  }

  method set_comments (Str() $comments) is also<set-comments> {
    adw_about_window_set_comments($!aaw, $comments);
  }

  method set_copyright (Str() $copyright) is also<set-copyright> {
    adw_about_window_set_copyright($!aaw, $copyright);
  }

  method set_debug_info (Str() $debug_info) is also<set-debug-info> {
    adw_about_window_set_debug_info($!aaw, $debug_info);
  }

  method set_debug_info_filename (Str() $filename)
    is also<set-debug-info-filename>
  {
    adw_about_window_set_debug_info_filename($!aaw, $filename);
  }

  method set_designers (CArray[Str] $designers) is also<set-designers> {
    adw_about_window_set_designers($!aaw, $designers);
  }

  method set_developer_name (Str() $developer_name)
    is also<set-developer-name>
  {
    adw_about_window_set_developer_name($!aaw, $developer_name);
  }

  method set_developers (CArray[Str] $developers) is also<set-developers> {
    adw_about_window_set_developers($!aaw, $developers);
  }

  method set_documenters (CArray[Str] $documenters) is also<set-documenters> {
    adw_about_window_set_documenters($!aaw, $documenters);
  }

  method set_issue_url (Str() $issue_url) is also<set-issue-url> {
    adw_about_window_set_issue_url($!aaw, $issue_url);
  }

  method set_license (Str() $license) is also<set-license> {
    adw_about_window_set_license($!aaw, $license);
  }

  method set_license_type (Int() $license_type) is also<set-license-type> {
    my GtkLicense $l = $license_type;

    adw_about_window_set_license_type($!aaw, $l);
  }

  method set_release_notes (Str() $release_notes) is also<set-release-notes> {
    adw_about_window_set_release_notes($!aaw, $release_notes);
  }

  method set_release_notes_version (Str() $version)
    is also<set-release-notes-version>
  {
    adw_about_window_set_release_notes_version($!aaw, $version);
  }

  method set_support_url (Str() $support_url) is also<set-support-url> {
    adw_about_window_set_support_url($!aaw, $support_url);
  }

  method set_translator_credits (Str() $translator_credits)
    is also<set-translator-credits>
  {
    adw_about_window_set_translator_credits($!aaw, $translator_credits);
  }

  method set_version (Str() $version) is also<set-version> {
    adw_about_window_set_version($!aaw, $version);
  }

  method set_website (Str() $website) is also<set-website> {
    adw_about_window_set_website($!aaw, $website);
  }

  # method show (Str() $first_property_name) {
  #   adw_show_about_window($!aaw, $first_property_name);
  # }

}
