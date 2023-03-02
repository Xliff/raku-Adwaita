

### /usr/src/libadwaita-1-1.2.0/src/adw-toast-overlay.h

sub adw_toast_overlay_add_toast (
  AdwToastOverlay $self,
  AdwToast        $toast
) 
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_overlay_get_child (AdwToastOverlay $self) 
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_overlay_new  
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_toast_overlay_set_child (
  AdwToastOverlay $self,
  GtkWidget       $child
) 
  is      native(adwaita)
  is      export
{ * }

