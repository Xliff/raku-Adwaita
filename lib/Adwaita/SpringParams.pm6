use v6.c;

use Method::Also;

use Adwaita::Raw::Types;
use Adwaita::Raw::SpringParams;

# BOXED

class Adwaita::SpringParams {
  has AdwSpringParams $!adw-sp is implementor;

  submethod BUILD ( :adwaita-spring-params(:$!adw-sp) )
  { }

  method Adwaita::Raw::Definitions::AdwSpringParams
    is also<AdwSpringParams>
  { $!adw-sp }

  method new (Num() $damping_ratio, Num() $mass, Num() $stiffness) {
    my gdouble ($d, $m, $s) = ($damping_ratio, $mass, $stiffness);

    my $adw-spring-params = adw_spring_params_new($d, $m, $s);

    $adw-spring-params ?? self.bless( :$adw-spring-params ) !! Nil;
  }

  method new_full (Num() $damping, Num() $mass, Num() $stiffness)
    is also<new-full> 
  {
    my gdouble ($d, $m, $s) = ($damping, $mass, $stiffness);

    my $adw-spring-params = adw_spring_params_new_full(
      $damping,
      $mass,
      $stiffness
    );

    $adw-spring-params ?? self.bless( :$adw-spring-params ) !! Nil;

  }

  method get_damping is also<get-damping> {
    adw_spring_params_get_damping($!adw-sp);
  }

  method get_damping_ratio is also<get-damping-ratio> {
    adw_spring_params_get_damping_ratio($!adw-sp);
  }

  method get_mass is also<get-mass> {
    adw_spring_params_get_mass($!adw-sp);
  }

  method get_stiffness is also<get-stiffness> {
    adw_spring_params_get_stiffness($!adw-sp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &adw_spring_params_get_type, $n, $t );
  }

  method ref {
    adw_spring_params_ref($!adw-sp);
    self;
  }

  method unref {
    adw_spring_params_unref($!adw-sp);
  }

}
