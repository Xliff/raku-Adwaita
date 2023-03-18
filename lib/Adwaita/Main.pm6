use v6.c;

use NativeCall;

use Adwaita::Raw::Types;

use GTK::Application;

use GLib::Roles::StaticClass;

class Adwaita::Main {

  method init {
    adw_init();

    GTK::Application.postInit;

    # $Adwaita-Widget-Types = readTypeManifest(
    #   ADWAITA_MANIFEST_FILE
    # );
  }

  method is_initialized {
    so adw_is_initialized();
  }

  method get_enable_animations (GtkWidget() $widget) {
    adw_get_enable_animations($widget);
  }

  method lerp (Num() $a, Num() $b, Num() $t) {
    my gdouble ($aa, $bb, $tt) = ($a, $b, $t);

    adw_lerp($aa, $bb, $tt);
  }

}


### /usr/src/libadwaita-1-1.2.0/src/adw-main.h

sub adw_init
  is      native(adwaita)
  is      export
{ * }

sub adw_is_initialized
  returns uint32
  is      native(adwaita)
  is      export
{ * }

### /usr/src/libadwaita-1-1.3~alpha/src/adw-animation-util.h

sub adw_get_enable_animations (GtkWidget $widget)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_lerp (
  gdouble $a,
  gdouble $b,
  gdouble $t
)
  returns gdouble
  is      native(adwaita)
  is      export
{ * }
