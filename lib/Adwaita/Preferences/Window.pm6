use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Preferences::Window;

use Adwaita::Window;
use Adwaita::Preferences::Page;

use GLib::Roles::Implementor;


our subset AdwPreferencesWindowAncestry is export of Mu
  where AdwPreferencesWindow | AdwWindowAncestry;

class Adwaita::Preferences::Window is Adwaita::Window {
  has AdwPreferencesWindow $!adw-pw is implementor;

  submethod BUILD ( :$adw-pref-window ) {
    self.setAdwPreferencesWindow($adw-pref-window) if $adw-pref-window;
  }

  method setAdwPreferencesWindow (AdwPreferencesWindowAncestry $_) {
    my $to-parent;

    $!adw-pw = do {
      when AdwPreferencesWindow {
        $to-parent = cast(AdwWindow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwPreferencesWindow, $_);
      }
    }
    self.setAdwWindow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwPreferencesWindow
    is also<AdwPreferencesWindow>
  { $!adw-pw }

  multi method new (
    $adw-pref-window where * ~~ AdwPreferencesWindowAncestry,

    :$ref = True
  ) {
    return unless $adw-pref-window;

    my $o = self.bless( :$adw-pref-window );
    $o.ref if $ref;
    $o;
  }

  method new ( *%a ) {
    my $adw-pref-window = adw_preferences_window_new();

    my $o = $adw-pref-window ?? self.bless( :$adw-pref-window ) !! Nil;
    $o.setAttributes(%a);
    $o;
  }

  # Type: boolean
  method can-navigate-back is rw  is g-property is also<can_navigate_back> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('can-navigate-back', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('can-navigate-back', $gv);
      }
    );
  }

  # Type: boolean
  method search-enabled is rw  is g-property is also<search_enabled> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('search-enabled', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('search-enabled', $gv);
      }
    );
  }

  # Type: AdwPreferencesPage (as GtkWidget)
  method visible-page ( :$raw = False )
    is rw
    is g-property
    is also<visible_page>
  {
    my $gv = GLib::Value.new( Adwaita::Preferences::Page.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible-page', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Preferences::Page.getTypePair
        )
      },
      STORE => -> $, AdwPreferencesPage() $val is copy {
        $gv.object = $val;
        self.prop_set('visible-page', $gv);
      }
    );
  }

  # Type: string
  method visible-page-name is rw  is g-property is also<visible_page_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible-page-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('visible-page-name', $gv);
      }
    );
  }

  method add (AdwPreferencesPage() $page) {
    #self.addBuildableChild($page);
    adw_preferences_window_add($!adw-pw, $page);
  }

  method add_toast (AdwToast() $toast) is also<add-toast> {
    adw_preferences_window_add_toast($!adw-pw, $toast);
  }

  method close_subpage is also<close-subpage> {
    adw_preferences_window_close_subpage($!adw-pw);
  }

  method get_can_navigate_back is also<get-can-navigate-back> {
    so adw_preferences_window_get_can_navigate_back($!adw-pw);
  }

  method get_search_enabled is also<get-search-enabled> {
    so adw_preferences_window_get_search_enabled($!adw-pw);
  }

  method get_visible_page ( :$raw = False ) is also<get-visible-page> {
    propReturnObject(
      adw_preferences_window_get_visible_page($!adw-pw),
      $raw,
      |Adwaita::Preferences::Page.getTypePair
    );
  }

  method get_visible_page_name is also<get-visible-page-name> {
    adw_preferences_window_get_visible_page_name($!adw-pw);
  }

  method present_subpage (GtkWidget() $subpage) is also<present-subpage> {
    adw_preferences_window_present_subpage($!adw-pw, $subpage);
  }

  method remove (AdwPreferencesPage() $page) {
    #self.removeBuildableChild($page);
    adw_preferences_window_remove($!adw-pw, $page);
  }

  method set_can_navigate_back (Int() $can_navigate_back)
    is also<set-can-navigate-back>
  {
    my gboolean $c = $can_navigate_back.so.Int;

    adw_preferences_window_set_can_navigate_back($!adw-pw, $can_navigate_back);
  }

  method set_search_enabled (Int() $search_enabled)
    is also<set-search-enabled>
  {
    my gboolean $s = $search_enabled.so.Int;

    adw_preferences_window_set_search_enabled($!adw-pw, $search_enabled);
  }

  method set_visible_page (AdwPreferencesPage() $page)
    is also<set-visible-page>
  {
    adw_preferences_window_set_visible_page($!adw-pw, $page);
  }

  method set_visible_page_name (Str() $name) is also<set-visible-page-name> {
    adw_preferences_window_set_visible_page_name($!adw-pw, $name);
  }

}
