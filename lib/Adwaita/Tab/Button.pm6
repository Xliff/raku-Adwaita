use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

our subset AdwTabButtonAncestry is export of Mu
  where AdwTabButton | GtkWidgetAncestry;

class Adwaita::Tab::Button is GTK::Widget:ver<4> {
  has AdwTabButton $!adw-tb is implementor;

  submethod BUILD ( :$adw-tab-button ) {
    self.setAdwTabButton($adw-tab-button) if $adw-tab-button
  }

  method setAdwTabButton (AdwTabButtonAncestry $_) {
    my $to-parent;

    $!adw-tb = do {
      when AdwTabButton {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwTabButton, $_);
      }
    }
    self.setGtkWidget($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwTabButton
    is also<AdwTabButton>
  { $!adw-tb }

  multi method new (
    $adw-tab-button where * ~~ AdwTabButtonAncestry,

    :$ref = True
  ) {
    return unless $adw-tab-button;

    my $o = self.bless( :$adw-tab-button );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-tab-button = adw_tab_button_new();

    my $o = $adw-tab-button ?? self.bless( :$adw-tab-button ) !! Nil;
    $o.setAttributes(%a);
    $o;
  }

  # Type: AdwTabView
  method view is rw  is g-property {
    my $gv = GLib::Value.new( AdwTabView );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('view', $gv);
        $gv.AdwTabView;
      },
      STORE => -> $,  $val is copy {
        $gv.AdwTabView = $val;
        self.prop_set('view', $gv);
      }
    );
  }

  method Activate {
    self.connect( $!adw-tb, 'activate' );
  }

  method Clicked {
    self.connect( $!adw-tb, 'clicked' );
  }

  method get_view ( :$raw = False ) is also<get-view> {
    propReturnObject(
      adw_tab_button_get_view($!adw-tb),
      $raw,
      |Adwaita::Tab::View.getTypePair
    );
  }

  method set_view (AdwTabView() $view) is also<set-view> {
    adw_tab_button_set_view($!adw-tb, $view);
  }

}


### /usr/src/libadwaita-1-1.3~alpha/src/adw-tab-button.h

sub adw_tab_button_get_view (AdwTabButton $self)
  returns AdwTabView
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_button_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_tab_button_set_view (
  AdwTabButton $self,
  AdwTabView   $view
)
  is      native(adwaita)
  is      export
{ * }
