use v6.c;

use NativeCall;

use Adwaita::Raw::Types;

use GLib::Roles::StaticClass;

class Adwaita::Main {

  method init {
    adw_init();
  }

  method is_initialized {
    so adw_is_initialized();
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
