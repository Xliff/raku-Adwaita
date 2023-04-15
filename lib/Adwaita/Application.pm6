use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;

use GTK::Application:ver<4>;
use Adwaita::Style::Manager;

class Adwaita::Application is GTK::Application:ver<4> {
  has AdwApplication $!adw-a is implementor;

  multi method new (Str() $app-id, Int() $flags, *%opts) {
    my GApplicationFlags $f = $flags;

    my $adw-application = adw_application_new($app-id, $flags);

    $adw-application ?? self.bless( :$adw-application, |%opts ) !! Nil;
  }
  multi method new (Str() $app-id, *%opts) {
    samewith( $app-id, %opts<flags>:delete // 0, |%opts )
  }

  method init is static {
    adw_init();

    self.postInit;

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

  method get_style_manager ( :$raw = False ) {
    propReturnObject(
      adw_application_get_style_manager($!adw-a),
      $raw,
      |Adwaita::Style::Manager.getTypePair
    );
  }

}

### /usr/src/libadwaita-1-1.3~alpha/src/adw-application.h

sub adw_application_get_style_manager (AdwApplication $self)
  returns AdwStyleManager
  is      native(adwaita)
  is      export
{ * }

sub adw_application_new (
  Str               $application_id,
  GApplicationFlags $flags
)
  returns AdwApplication
  is      native(adwaita)
  is      export
{ * }

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
