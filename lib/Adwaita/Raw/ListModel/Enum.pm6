use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Adwaita::Raw::Definitions;

unit package Adwaita::Raw::ListModel::Enum;

### /usr/src/libadwaita-1-1.2.0/src/adw-enum-list-model.h

sub adw_enum_list_model_find_position (
  AdwEnumListModel $self,
  gint             $value
)
  returns guint
  is      native(adwaita)
  is      export
{ * }

sub adw_enum_list_model_get_enum_type (AdwEnumListModel $self)
  returns GType
  is      native(adwaita)
  is      export
{ * }

sub adw_enum_list_model_new (GType $enum_type)
  returns AdwEnumListModel
  is      native(adwaita)
  is      export
{ * }

sub adw_enum_list_item_get_name (AdwEnumListItem $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_enum_list_item_get_nick (AdwEnumListItem $self)
  returns Str
  is      native(adwaita)
  is      export
{ * }

sub adw_enum_list_item_get_value (AdwEnumListItem $self)
  returns gint
  is      native(adwaita)
  is      export
{ * }

sub adw_enum_list_item_get_type
  returns GType  
  is      native(adwaita)
  is      export
{ * }
