use v6.c;

use Method::Also;
use NativeCall;

use Adwaita::Raw::Types:ver<4>;

role Adwaita::Roles::Signals::Tab::View:ver<4> {
  has %!signals-adw-tv;

  method connect-tab-page (
    $obj,
    $signal,
    &handler?
  )
    is also<connect_tab_page>
  {
    my $hid;
    %!signals-adw-tv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g_connect_tab_page($obj, $signal,
        -> $, $tp, $ud {
          CATCH {
            default { note($_) }
          }

          $s.emit( [self, $tp, $ud] );
        },
        Pointer, 0
      );
      [ self.create-signal-supply($signal, $s), $obj, $hid];
    };
    %!signals-adw-tv{$signal}[0].tap(&handler) with &handler;
    %!signals-adw-tv{$signal}[0];
  }

  method connect-tab-page-action (
    $obj,
    $signal,
    &handler?
  )
    is also<connect_tab_page_action>
  {
    my $hid;
    %!signals-adw-tv{$signal} //= do {
      my $s = Supplier.new;
      $hid = g_connect_tab_page($obj, $signal,
        -> $, $tp, $i, $ud {
          CATCH {
            default { note($_) }
          }

          $s.emit( [self, $tp, $i, $ud] );
        },
        Pointer, 0
      );
      [ self.create-signal-supply($signal, $s), $obj, $hid];
    };
    %!signals-adw-tv{$signal}[0].tap(&handler) with &handler;
    %!signals-adw-tv{$signal}[0];
  }

}

sub g_connect_tab_page (
  Pointer $app,
  Str     $name,
          &handler (AdwTabView, AdwTabPage, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native('gobject-2.0')
  is      symbol('g_signal_connect_object')
{ * }

sub g_connect_tab_page_action (
  Pointer $app,
  Str     $name,
          &handler (AdwTabView, AdwTabPage, gint, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native('gobject-2.0')
  is      symbol('g_signal_connect_object')
{ * }
