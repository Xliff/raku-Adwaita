use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Widget:ver<4>;

use GLib::Roles::Implementor;

class Adwaita::View::Switcher is GTK::Widget:ver<4> {
  has AdwViewSwitcher $!adw-vs is implementor;

  multi method new ( *%a ) {
    my $adw-view-switcher = adw_view_switcher_new();

    my $o = $adw-view-switcher ?? self.bless( :$adw-view-switcher ) !! Nil;
    $o.setrAttributes(%a);
    $o;
  }

  method get_policy ( :$enum = True ) {
    my $p = adw_view_switcher_get_policy($!adw-vs);
    return $p unless $enum;
    AdwViewSwitcherPolicyEnum($p);
  }

  method get_stack {
    adw_view_switcher_get_stack($!adw-vs);
  }

  method set_policy (Int() $policy) {
    my AdwViewSwitcherPolicy $p = $policy;

    adw_view_switcher_set_policy($!adw-vs, $p);
  }

  method set_stack (AdwViewStack() $stack) {
    adw_view_switcher_set_stack($!adw-vs, $stack);
  }

}

### /usr/src/libadwaita-1-1.3~alpha/src/adw-view-switcher.h

sub adw_view_switcher_get_policy (AdwViewSwitcher $self)
  returns AdwViewSwitcherPolicy
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_get_stack (AdwViewSwitcher $self)
  returns AdwViewStack
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_set_policy (
  AdwViewSwitcher       $self,
  AdwViewSwitcherPolicy $policy
)
  is      native(adwaita)
  is      export
{ * }

sub adw_view_switcher_set_stack (
  AdwViewSwitcher $self,
  AdwViewStack    $stack
)
  is      native(adwaita)
  is      export
{ * }
