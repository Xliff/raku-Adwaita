use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Dialog::Preferences;

use Adwaita::Dialog;
use Adwaita::Preferences::Page;

use GLib::Roles::Implementor;

our subset AdwPreferencesDialogAncestry is export of Mu
  where AdwPreferencesDialog | AdwDialogAncestry;

class Adwaita::Dialog::Preferences is Adwaita::Dialog {
  has AdwPreferencesDialog $!adw-p-d is implementor;


  submethod BUILD ( :$adw-pref-dlg ) {
    self.setAdwPreferencesDialog($adw-pref-dlg) if $adw-pref-dlg
  }

  method setAdwPreferencesDialog (AdwPreferencesDialogAncestry $_) {
    my $to-parent;

    $!adw-p-d = do {
      when AdwPreferencesDialog {
        $to-parent = cast(AdwDialog, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwPreferencesDialog, $_);
      }
    }
    self.setAdwDialog($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwPreferencesDialog
    is also<AdwPreferencesDialog>
  { $!adw-p-d }

  multi method new (
     $adw-pref-dlg where * ~~ AdwPreferencesDialogAncestry,

    :$ref                                                   = True
  ) {
    return unless $adw-pref-dlg;

    my $o = self.bless( :$adw-pref-dlg );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $adw-pref-dlg = adw_preferences_dialog_new();

    $adw-pref-dlg ?? self.bless( :$adw-pref-dlg ) !! Nil;
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

  # Type: GtkWidget - Handling is wrong. Needs the full monty!
  method visible-page ( :$raw = False )
    is rw
    is g-property
    is also<visible_page>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible-page', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Adwaita::Preferences::Page.getTypePair
        );
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
    adw_preferences_dialog_add($!adw-p-d, $page);
  }

  method add_toast (AdwToast() $toast) is also<add-toast> {
    adw_preferences_dialog_add_toast($!adw-p-d, $toast);
  }

  method get_search_enabled is also<get-search-enabled> {
    so adw_preferences_dialog_get_search_enabled($!adw-p-d);
  }

  method get_visible_page ( :$raw = False ) is also<get-visible-page> {
    propReturnObject(
      adw_preferences_dialog_get_visible_page($!adw-p-d),
      $raw,
      |Adwaita::Preferences::Page.getTypePair
     );
  }

  method get_visible_page_name is also<get-visible-page-name> {
    adw_preferences_dialog_get_visible_page_name($!adw-p-d);
  }

  method pop_subpage is also<pop-subpage> {
    so adw_preferences_dialog_pop_subpage($!adw-p-d);
  }

  method push_subpage (AdwNavigationPage() $page) is also<push-subpage> {
    adw_preferences_dialog_push_subpage($!adw-p-d, $page);
  }

  method remove (AdwPreferencesPage() $page) {
    adw_preferences_dialog_remove($!adw-p-d, $page);
  }

  method set_search_enabled (Int() $search_enabled)
    is also<set-search-enabled>
  {
    my gboolean $s = $search_enabled.so.Int;

    adw_preferences_dialog_set_search_enabled($!adw-p-d, $s);
  }

  method set_visible_page (AdwPreferencesPage() $page)
    is also<set-visible-page>
  {
    adw_preferences_dialog_set_visible_page($!adw-p-d, $page);
  }

  method set_visible_page_name (Str() $name) is also<set-visible-page-name> {
    adw_preferences_dialog_set_visible_page_name($!adw-p-d, $name);
  }

}
