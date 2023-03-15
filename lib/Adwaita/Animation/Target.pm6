use v6.c;

use Method::Also;

use Adwaita::Raw::Types;
use Adwaita::Raw::Animation::Target;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AdwAnimationTargetAncestry is export of Mu
  where AdwAnimationTarget | GObject;

class Adwaita::Animation::Target {
  also does GLib::Roles::Object;

  has AdwAnimationTarget $!adw-at is implementor;

  submethod BUILD ( :$adw-animation-target ) {
    self.setAdwAnimationTarget($adw-animation-target)
      if $adw-animation-target
  }

  method setAdwAnimationTarget (AdwAnimationTargetAncestry $_) {
    my $to-parent;

    $!adw-at = do {
      when AdwAnimationTarget {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwAnimationTarget, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwAnimationTarget
    is also<AdwAnimationTarget>
  { $!adw-at }

  multi method new (
    $adw-animation-target where * ~~ AdwAnimationTargetAncestry,
    
    :$ref = True
  ) {
    return unless $adw-animation-target;

    my $o = self.bless( :$adw-animation-target );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_animation_target_get_type, $n, $t );
  }

}

  # method adw_callback_animation_target_new (
  #   gpointer               $user_data,
  #   GDestroyNotify         $destroy
  # ) {
  #   adw_callback_animation_target_new($!adw-at, $user_data, $destroy);
  # }
  #
  # method adw_property_animation_target_get_object {
  #   adw_property_animation_target_get_object($!adw-at);
  # }
  #
  # method adw_property_animation_target_get_pspec {
  #   adw_property_animation_target_get_pspec($!adw-at);
  # }
  #
  # method adw_property_animation_target_new (
  #   GObject $object,
  #   Str     $property_name
  # ) {
  #   adw_property_animation_target_new($!adw-at, $property_name);
  # }
  #
  # method adw_property_animation_target_new_for_pspec (
  #   GObject    $object,
  #   GParamSpec $pspec
  # ) {
  #   adw_property_animation_target_new_for_pspec($!adw-at, $pspec);
  # }
  #
