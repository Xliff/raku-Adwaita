use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Clamp;

### /usr/src/libadwaita-1-1.2.0/src/adw-clamp.h

sub adw_clamp_get_child (AdwClamp $self)
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_get_maximum_size (AdwClamp $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_get_tightening_threshold (AdwClamp $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_new
  returns AdwClamp
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_set_child (
  AdwClamp  $self,
  GtkWidget $child
)
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_set_maximum_size (
  AdwClamp $self,
  gint     $maximum_size
)
  is      native(adwaita)
  is      export
{ * }

sub adw_clamp_set_tightening_threshold (
  AdwClamp $self,
  gint     $tightening_threshold
)
  is      native(adwaita)
  is      export
{ * }
