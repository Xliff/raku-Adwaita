use v6.c;

use Method::Also;
use NativeCall;

use Adwaita::Raw::Types;

role Adwaita::Roles::Signals::Navigation::View {
  has %!signals-adw-nv;

  method connect-navigation-page (
     $obj,
     $signal,
     &handler?,
    :$raw       = False
  )
    is also<connect_page>
  {
    my $hid;
    %!signals-adw-nv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g_connect_navigation_page($obj, $signal,
        -> $, $ud --> AdwNavigationPage {
          CATCH {
            default { note($_) }
          }

          my $v = $s.emit( [self, $ud] );
          $v = $v.AdwaitaNavigationPage
            if $raw && $v.^can('AdwaitaNavigationPage');
          $v;
        },
        Pointer, 0
      );
      [ self.create-signal-supply($signal, $s), $obj, $hid];
    };
    %!signals-adw-nv{$signal}[0].tap(&handler) with &handler;
    %!signals-adw-nv{$signal}[0];
  }

}

sub g_connect_navigation_page (
  Pointer $app,
  Str     $name,
          &handler (AdwNavigationView, gpointer --> AdwNavigationPage),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native('gobject-2.0')
  is      symbol('g_signal_connect_object')
{ * }
