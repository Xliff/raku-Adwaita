use v6.c;

use Method::Also;
use NativeCall;

use Adwaita::Raw::Types;

role Adwaita::Roles::Signals::Tab::Overview {
  has %!signals-adw-to;

  method connect-tab-page-value (
    $obj,
    $signal,
    &handler?
  )
    is also<connect_tab_page_value>
  {
    my $hid;
    %!signals-adw-to{$signal} //= do {
      my $s = Supplier.new;
      $hid = g_connect_tab_page_value($obj, $signal,
        -> $, $tp, $v, $ud {
          CATCH {
            default { note($_) }
          }

          $s.emit( [self, $tp, $v, $ud] );
        },
        Pointer, 0
      );
      [ self.create-signal-supply($signal, $s), $obj, $hid];
    };
    %!signals-adw-to{$signal}[0].tap(&handler) with &handler;
    %!signals-adw-to{$signal}[0];
  }

}

sub g_connect_tab_page_value (
  Pointer $app,
  Str     $name,
          &handler (AdwTabView, AdwTabPage, GValue, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native('gobject-2.0')
  is      symbol('g_signal_connect_object')
{ * }
