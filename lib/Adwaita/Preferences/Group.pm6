use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Preferences::Group;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwPreferencesGroupAncestry is export of Mu
  where AdwPreferencesGroup | GtkWidgetAncestry;

class Adwaita::Preferences::Group is GTK::Widget:ver<4> {
  has AdwPreferencesGroup $!adw-pg is implementor;

  submethod BUILD ( :$adw-preferences-group ) {
    self.setAdwPreferencesGroup($adw-preferences-group)
      if $adw-preferences-group
  }

  method setAdwPreferencesGroup (AdwPreferencesGroupAncestry $_) {
    my $to-parent;

    $!adw-pg = do {
      when AdwPreferencesGroup {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwPreferencesGroup, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwPreferencesGroup
    is also<AdwPreferencesGroup>
  { $!adw-pg }

  multi method new (
    $adw-preferences-group where * ~~ AdwPreferencesGroupAncestry,

    :$ref = True
  ) {
    return unless $adw-preferences-group;

    my $o = self.bless( :$adw-preferences-group );
    $o.ref if $ref;
    $o;
  }
  multi method new (*%a) {
    my $adw-preferences-group = adw_preferences_group_new();

    my $o = $adw-preferences-group ?? self.bless( :$adw-preferences-group )
                                   !! Nil;
    $o.setAttributes(%a);
    $o;
  }

  # Type: string
  method description is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('description', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('description', $gv);
      }
    );
  }

  # Type: AdwWidget
  method header-suffix (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
    is also<header_suffix>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('header-suffix', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('header-suffix', $gv);
      }
    );
  }

  # Type: string
  method title is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('title', $gv);
      }
    );
  }

  method add (GtkWidget() $child)
    is also<
      append
      add-child
      add_child
    >
  {
    # self.addBuildableChild($child);
    adw_preferences_group_add($!adw-pg, $child);
  }

  method get_description is also<get-description> {
    adw_preferences_group_get_description($!adw-pg);
  }

  method get_header_suffix (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-header-suffix>
  {
    returnProperWidget(
      adw_preferences_group_get_header_suffix($!adw-pg),
      $raw,
      $proper
    );
  }

  method get_title is also<get-title> {
    adw_preferences_group_get_title($!adw-pg);
  }

  method remove (GtkWidget() $child) {
    #self.removeBuildableChild($child);
    adw_preferences_group_remove($!adw-pg, $child);
  }

  method set_description (Str() $description) is also<set-description> {
    adw_preferences_group_set_description($!adw-pg, $description);
  }

  method set_header_suffix (GtkWidget() $suffix) is also<set-header-suffix> {
    adw_preferences_group_set_header_suffix($!adw-pg, $suffix);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_preferences_group_set_title($!adw-pg, $title);
  }

}
