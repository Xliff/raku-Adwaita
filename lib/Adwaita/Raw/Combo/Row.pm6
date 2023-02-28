use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Definitions:ver<4>;
use GTK::Raw::Structs:ver<4>;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::Combo::Row;

### /usr/src/libadwaita-1-1.2.0/src/adw-combo-row.h

sub adw_combo_row_get_expression (AdwComboRow $self)
  returns GtkExpression
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_get_factory (AdwComboRow $self)
  returns GtkListItemFactory
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_get_list_factory (AdwComboRow $self)
  returns GtkListItemFactory
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_get_model (AdwComboRow $self)
  returns GListModel
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_get_selected (AdwComboRow $self)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_get_selected_item (AdwComboRow $self)
  returns Pointer
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_get_use_subtitle (AdwComboRow $self)
  returns uint32
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_new
  returns GtkWidget
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_set_expression (
  AdwComboRow   $self,
  GtkExpression $expression
)
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_set_factory (
  AdwComboRow        $self,
  GtkListItemFactory $factory
)
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_set_list_factory (
  AdwComboRow        $self,
  GtkListItemFactory $factory
)
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_set_model (
  AdwComboRow $self,
  GListModel  $model
)
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_set_selected (
  AdwComboRow $self,
  guint       $position
)
  is      native(adwaita)
  is      export
{ * }

sub adw_combo_row_set_use_subtitle (
  AdwComboRow $self,
  gboolean    $use_subtitle
)
  is      native(adwaita)
  is      export
{ * }
