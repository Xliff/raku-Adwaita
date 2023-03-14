use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package Adwaita::Raw::Definitions;

our %Adwaita-Widget-Types is export;

constant ADWAITA_MANIFEST_FILE is export = "adwaita-type-manifest.json";
constant adwaita               is export = 'adwaita-1',v0;

class AdwAvatar            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwActionRow         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwBin               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwButtonContent     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwCarousel          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwClamp             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwComboRow          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEntryRow          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEnumListItem      is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEnumListModel     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwExpanderRow       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwFlap              is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwHeaderBar         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwLeaflet           is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwLeafletPage       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPasswordEntryRow  is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesGroup  is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesPage   is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesRow    is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesWindow is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSplitButton       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSpringParams      is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSqueezer          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSqueezerPage      is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwStatusPage        is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwStyleManager      is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwToast             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwToastOverlay      is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwWindow            is repr<CPointer> is export does GLib::Roles::Pointers { }
