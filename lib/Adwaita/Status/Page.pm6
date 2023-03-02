use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Status::Page;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwStatusPageAncestry is export of Mu
  where AdwStatusPage | GtkWidgetAncestry;

class Adwaita::Status::Page is GTK::Widget:ver<4> {
  has AdwStatusPage $!adw-sp is implementor;

  submethod BUILD ( :$adw-status-page ) {
    self.setAdwStatusPage($adw-status-page) if $adw-status-page
  }

  method setAdwStatusPage (AdwStatusPageAncestry $_) {
    my $to-parent;

    $!adw-sp = do {
      when AdwStatusPage {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwStatusPage, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwStatusPage
    is also<AdwStatusPage>
  { $!adw-sp }

  multi method new (
    $adw-status-page where * ~~ AdwStatusPageAncestry,

    :$ref = True
  ) {
    return unless $adw-status-page;

    my $o = self.bless( :$adw-status-page );
    $o.ref if $ref;
    $o;
  }
  multi method new (*%a) {
    my $adw-status-page = adw_status_page_new();

    my $o = $adw-status-page ?? self.bless( :$adw-status-page ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: GTkWidget
  method child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child', $gv);
        returnProperWidget(
          $gv.object,
          $raw,
          $proper
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        #self.setBuildableChild(0, $val);
        $gv.object = $val;
        self.prop_set('child', $gv);
      }
    );
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

  # Type: string
  method icon-name is rw  is g-property is also<icon_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('icon-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('icon-name', $gv);
      }
    );
  }

  # Type: Gdkaintable
  method paintable ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GDK::Paintable.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('paintable', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GDK::Paintable.getTypePair
        )
      },
      STORE => -> $, GdkPaintable() $val is copy {
        $gv.object = $val;
        self.prop_set('paintable', $gv);
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

  method append (GtkWidget() $widget)
    is also<
      add_child
      add-child
    >
  {
    self.set_child($widget);
  }

  method get_child (
    :$raw           = False,
    :quick(:$fast)  = False,
    :slow(:$proper) = $fast.not
  )
    is also<get-child>
  {
    returnProperWidget(
      adw_status_page_get_child($!adw-sp),
      $raw,
      $proper
    );
  }

  method get_description is also<get-description> {
    adw_status_page_get_description($!adw-sp);
  }

  method get_icon_name is also<get-icon-name> {
    adw_status_page_get_icon_name($!adw-sp);
  }

  method get_paintable ( :$raw = False ) is also<get-paintable> {
    propReturnObject(
      adw_status_page_get_paintable($!adw-sp),
      $raw,
      |GDK::Paintable.getTypePair
    );
  }

  method get_title is also<get-title> {
    adw_status_page_get_title($!adw-sp);
  }

  method set_child (GtkWidget() $child) is also<set-child> {
    #self.setBuildableChild(0, $child);
    adw_status_page_set_child($!adw-sp, $child);
  }

  method set_description (Str() $description)
    is also<set-description>
  {
    adw_status_page_set_description($!adw-sp, $description);
  }

  method set_icon_name (Str() $icon_name)
    is also<set-icon-name>
  {
    adw_status_page_set_icon_name($!adw-sp, $icon_name);
  }

  method set_paintable (GdkPaintable() $paintable)
    is also<set-paintable>
  {
    adw_status_page_set_paintable($!adw-sp, $paintable);
  }

  method set_title (Str() $title) is also<set-title> {
    adw_status_page_set_title($!adw-sp, $title);
  }

  method unsetChild {
    self.set_child(GtkWidget);
  }

}
