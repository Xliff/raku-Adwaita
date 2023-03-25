use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Subs;
use Adwaita::Raw::Definitions;

use GLib::Roles::StaticClass;

package Adwaita::Raw::Enums {

  constant AdwAnimationState is export := guint32;
  our enum AdwAnimationStateEnum is export <
    ADW_ANIMATION_IDLE
    ADW_ANIMATION_PAUSED
    ADW_ANIMATION_PLAYING
    ADW_ANIMATION_FINISHED
  >;

  constant AdwCenteringPolicy is export := guint32;
  our enum AdwCenteringPolicyEnum is export <
    ADW_CENTERING_POLICY_LOOSE
    ADW_CENTERING_POLICY_STRICT
  >;

  constant AdwColorScheme is export := guint32;
  our enum AdwColorSchemeEnum is export <
    ADW_COLOR_SCHEME_DEFAULT
    ADW_COLOR_SCHEME_FORCE_LIGHT
    ADW_COLOR_SCHEME_PREFER_LIGHT
    ADW_COLOR_SCHEME_PREFER_DARK
    ADW_COLOR_SCHEME_FORCE_DARK
  >;

  constant AdwEasing is export := guint32;
  our enum AdwEasingEnum is export <
    ADW_LINEAR
    ADW_EASE_IN_QUAD
    ADW_EASE_OUT_QUAD
    ADW_EASE_IN_OUT_QUAD
    ADW_EASE_IN_CUBIC
    ADW_EASE_OUT_CUBIC
    ADW_EASE_IN_OUT_CUBIC
    ADW_EASE_IN_QUART
    ADW_EASE_OUT_QUART
    ADW_EASE_IN_OUT_QUART
    ADW_EASE_IN_QUINT
    ADW_EASE_OUT_QUINT
    ADW_EASE_IN_OUT_QUINT
    ADW_EASE_IN_SINE
    ADW_EASE_OUT_SINE
    ADW_EASE_IN_OUT_SINE
    ADW_EASE_IN_EXPO
    ADW_EASE_OUT_EXPO
    ADW_EASE_IN_OUT_EXPO
    ADW_EASE_IN_CIRC
    ADW_EASE_OUT_CIRC
    ADW_EASE_IN_OUT_CIRC
    ADW_EASE_IN_ELASTIC
    ADW_EASE_OUT_ELASTIC
    ADW_EASE_IN_OUT_ELASTIC
    ADW_EASE_IN_BACK
    ADW_EASE_OUT_BACK
    ADW_EASE_IN_OUT_BACK
    ADW_EASE_IN_BOUNCE
    ADW_EASE_OUT_BOUNCE
    ADW_EASE_IN_OUT_BOUNCE
  >;

  constant AdwFlapFoldPolicy is export := guint32;
  our enum AdwFlapFoldPolicyEnum is export <
    ADW_FLAP_FOLD_POLICY_NEVER
    ADW_FLAP_FOLD_POLICY_ALWAYS
    ADW_FLAP_FOLD_POLICY_AUTO
  >;

  constant AdwFlapTransitionType is export := guint32;
  our enum AdwFlapTransitionTypeEnum is export <
    ADW_FLAP_TRANSITION_TYPE_OVER
    ADW_FLAP_TRANSITION_TYPE_UNDER
    ADW_FLAP_TRANSITION_TYPE_SLIDE
  >;

  constant AdwFoldThresholdPolicy is export := guint32;
  our enum AdwFoldThresholdPolicyEnum is export <
    ADW_FOLD_THRESHOLD_POLICY_MINIMUM
    ADW_FOLD_THRESHOLD_POLICY_NATURAL
  >;

  constant AdwLeafletTransitionType is export := guint32;
  our enum AdwLeafletTransitionTypeEnum is export <
    ADW_LEAFLET_TRANSITION_TYPE_OVER
    ADW_LEAFLET_TRANSITION_TYPE_UNDER
    ADW_LEAFLET_TRANSITION_TYPE_SLIDE
  >;

  constant AdwNavigationDirection is export := guint32;
  our enum AdwNavigationDirectionEnum is export <
    ADW_NAVIGATION_DIRECTION_BACK
    ADW_NAVIGATION_DIRECTION_FORWARD
  >;

  constant AdwResponseAppearance is export := guint32;
  our enum AdwResponseAppearanceEnum is export <
    ADW_RESPONSE_DEFAULT
    ADW_RESPONSE_SUGGESTED
    ADW_RESPONSE_DESTRUCTIVE
  >;

  constant AdwSqueezerTransitionType is export := guint32;
  our enum AdwSqueezerTransitionTypeEnum is export <
    ADW_SQUEEZER_TRANSITION_TYPE_NONE
    ADW_SQUEEZER_TRANSITION_TYPE_CROSSFADE
  >;

  constant AdwSystemColorScheme is export := guint32;
  our enum AdwSystemColorSchemeEnum is export <
    ADW_SYSTEM_COLOR_SCHEME_DEFAULT
    ADW_SYSTEM_COLOR_SCHEME_PREFER_DARK
    ADW_SYSTEM_COLOR_SCHEME_PREFER_LIGHT
  >;

  constant AdwTabViewShortcuts is export := guint32;
  our enum AdwTabViewShortcutsEnum is export <
    ADW_TAB_VIEW_SHORTCUT_NONE
    ADW_TAB_VIEW_SHORTCUT_CONTROL_TAB
    ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_TAB
    ADW_TAB_VIEW_SHORTCUT_CONTROL_PAGE_UP
    ADW_TAB_VIEW_SHORTCUT_CONTROL_PAGE_DOWN
    ADW_TAB_VIEW_SHORTCUT_CONTROL_HOME
    ADW_TAB_VIEW_SHORTCUT_CONTROL_END
    ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_UP
    ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_PAGE_DOWN
    ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_HOME
    ADW_TAB_VIEW_SHORTCUT_CONTROL_SHIFT_END
    ADW_TAB_VIEW_SHORTCUT_ALT_DIGITS
    ADW_TAB_VIEW_SHORTCUT_ALT_ZERO
    ADW_TAB_VIEW_SHORTCUT_ALL_SHORTCUTS
  >;

  constant AdwToastPriority is export := guint32;
  our enum AdwToastPriorityEnum is export <
    ADW_TOAST_PRIORITY_NORMAL
    ADW_TOAST_PRIORITY_HIGH
  >;

  constant AdwViewSwitcherPolicy is export := guint32;
  our enum AdwViewSwitcherPolicyEnum is export <
    ADW_VIEW_SWITCHER_POLICY_NARROW
    ADW_VIEW_SWITCHER_POLICY_WIDE
  >
}

sub adw_flap_fold_policy_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }

class Adwaita::Enums::FlapFoldPolicy {
  also does GLib::Roles::StaticClass;

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_flap_fold_policy_get_type, $n, $t );
  }
}

sub adw_flap_transition_type_get_type
  returns GType
  is      native(adwaita)
  is      export
{ * }

sub adw_easing_get_type
  returns GType
  is      export
  is      native(adwaita)
{ * }

class Adwaita::Enums::FlapTransitionType {
  also does GLib::Roles::StaticClass;

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &adw_flap_transition_type_get_type,
      $n,
      $t
    );
  }
}

class Adwaita::Enums::Easing {
  also does GLib::Roles::StaticClass;

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_easing_get_type, $n, $t );
  }
}
