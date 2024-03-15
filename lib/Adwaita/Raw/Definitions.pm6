use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package Adwaita::Raw::Definitions;

our %Adwaita-Widget-Types is export;

constant ADWAITA_MANIFEST_FILE is export = "adwaita-type-manifest.json";
constant adwaita               is export = 'adwaita-1',v0;
constant adwaita-prefix        is export = 'Adw';

class AdwAboutDialog             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwAlertDialog             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwActionRow               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwApplication             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwApplicationWindow       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwAnimation               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwAnimationTarget         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwAvatar                  is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwBanner                  is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwBin                     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwBreakpoint              is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwBreakpointCondition     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwButtonContent           is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwCarousel                is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwClamp                   is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwClampLayout             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwClampScrollable         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwComboRow                is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwDialog                  is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEntryRow                is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEnumListItem            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwEnumListModel           is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwExpanderRow             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwFlap                    is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwHeaderBar               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwLeaflet                 is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwLeafletPage             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwMessageDialog           is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwNavigationView          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwNavigationPage          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwNavigationSplitView     is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwOverlaySplitView        is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPasswordEntryRow        is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesDialog       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesGroup        is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesPage         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesRow          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPreferencesWindow       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwPropertyAnimationTarget is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSplitButton             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSpringAnimation         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSpringParams            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSqueezer                is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSqueezerPage            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSwipeTracker            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSwitchRow               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwToolbarView             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwViewStack               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwViewStackPage           is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwViewSwitcher            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwViewSwitcherBar         is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwViewSwitcherTitle       is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwStatusPage              is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwStyleManager            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwSwipeable               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwTabBar                  is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwTabButton               is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwTabPage                 is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwTabOverview             is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwTabView                 is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwTimedAnimation          is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwToast                   is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwToastOverlay            is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwWindow                  is repr<CPointer> is export does GLib::Roles::Pointers { }
class AdwWindowTitle             is repr<CPointer> is export does GLib::Roles::Pointers { }
