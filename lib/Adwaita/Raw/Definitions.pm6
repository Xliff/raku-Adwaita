use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package Adwaita::Raw::Definitions;

constant adwaita is export = 'adwaita-1',v0;

class AdwActionRow        is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwBin              is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwButtonContent    is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwCarousel         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwClamp            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEntryRow         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEnumListItem     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEnumListModel    is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwExpanderRow      is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwComboRow         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPasswordEntryRow is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesGroup is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesRow   is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSpringParams     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwStatusPage       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwStyleManager     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwToast            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwWindow           is repr<CPointer> is export does GLib::Roles::Pointers { }
