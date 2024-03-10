use v6.c;

use Method::Also;

use NativeCall;

use Adwaita::Raw::Types;
use Adwaita::Raw::Breakpoint;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset AdwBreakpointConditionAncestry is export of Mu
  where AdwBreakpointCondition | GObject;

class Adwaita::Breakpoint::Condition {
  also does GLib::Roles::Object;

  has AdwBreakpointCondition $!adw-b-c is implementor;

  submethod BUILD ( :$adw-break-cond ) {
    self.setAdwBreakpointCondition($adw-break-cond) if $adw-break-cond
  }

  method setAdwBreakpointCondition (AdwBreakpointConditionAncestry $_) {
    my $to-parent;

    $!adw-b-c = do {
      when AdwBreakpointCondition {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwBreakpointCondition, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwBreakpointCondition
    is also<AdwBreakpointCond>
  { $!adw-b-c }

  method new (
     $adw-break-cond where * ~~ AdwBreakpointConditionAncestry,

    :$ref                                                       = True
  ) {
    return unless $adw-break-cond;

    my $o = self.bless( :$adw-break-cond );
    $o.ref if $ref;
    $o;
  }

  method new_and (
    AdwBreakpointCondition() $condition_1,
    AdwBreakpointCondition() $condition_2
  )
    is also<new-and>
  {
    my $adw-break-cond = adw_breakpoint_condition_new_and(
      $condition_1,
      $condition_2
    );

    $adw-break-cond ?? self.bless( :$adw-break-cond ) !! Nil
  }

  method new_length (Int() $type, Num() $value, Int() $unit)
    is also<new-length>
  {
    my AdwBreakpointConditionLengthType $t = $type;
    my gdouble                          $v = $value;
    my AdwLengthUnit                    $u = $unit;

    my $adw-break-cond = adw_breakpoint_condition_new_length($t, $v, $u);

    $adw-break-cond ?? self.bless( :$adw-break-cond ) !! Nil
  }

  method new_or (
    AdwBreakpointCondition() $condition_1,
    AdwBreakpointCondition() $condition_2
  )
    is also<new-or>
  {
    my $adw-break-cond = adw_breakpoint_condition_new_or(
      $condition_1,
      $condition_2
    );

    $adw-break-cond ?? self.bless( :$adw-break-cond ) !! Nil
  }

  method new_ratio (Int() $type, Int() $width, Int() $height)
    is also<new-ratio>
  {
    my AdwBreakpointConditionRatioType  $t      =  $type;
    my gint                            ($w, $h) = ($width, $height);

    my $adw-break-cond = adw_breakpoint_condition_new_ratio(
      $t,
      $width,
      $height
    );

    $adw-break-cond ?? self.bless( :$adw-break-cond ) !! Nil
  }

  method parse (Str() $cond) {
    my $adw-break-cond = adw_breakpoint_condition_parse($cond);

    $adw-break-cond ?? self.bless( :$adw-break-cond ) !! Nil
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      adw_breakpoint_condition_copy($!adw-b-c),
      $raw,
      |::?CLASS.getTypePair
    );
  }

  method free {
    adw_breakpoint_condition_free($!adw-b-c);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &adw_breakpoint_condition_get_type,
      $n,
      $t
    );
  }

  method to_string is also<to-string> {
    adw_breakpoint_condition_to_string($!adw-b-c);
  }
}


our subset AdwBreakpointAncestry is export of Mu
  where AdwBreakpoint | GObject;

class Adwaita::Breakpoint {
  also does GLib::Roles::Object;

  has AdwBreakpoint $!adw-b is implementor;

  submethod BUILD ( :$adw-break ) {
    self.setAdwBreakpoint($adw-break) if $adw-break
  }

  method setAdwBreakpoint (AdwBreakpointAncestry $_) {
    my $to-parent;

    $!adw-b = do {
      when AdwBreakpoint {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwBreakpoint, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwBreakpoint
    is also<AdwBreakpoint>
  { $!adw-b }

  multi method new (
     $adw-break where * ~~ AdwBreakpointAncestry,

    :$ref                                          = True
  ) {
    return unless $adw-break;

    my $o = self.bless( :$adw-break );
    $o.ref if $ref;
    $o;
  }
  multi method new (AdwBreakpointCondition() $condition) {
    my $adw-break = adw_breakpoint_new($condition);

    $adw-break ?? self.bless( :$adw-break ) !! Nil;
  }

  method add_setter (
    GObject()       $object,
    Str()           $property,
    GValue()        $value
  )
    is also<add-setter>
  {
    adw_breakpoint_add_setter(
      $!adw-b,
      $object,
      $property,
      $value
    );
  }

  method add_setters ( *@args ) is also<add-setters> {
    X::GLib::InvalidSize.new(
      message => "Argument count must be divisible by triplet: {
        '' }object, name, value. It is not at { @args.elems }!"
    ).throw unless @args.elems %% 3;

    my ($objects, $names, $values);
    for @args.rotor(3) {
      $objects.push: .[0];
      $names.push:   .[1];
      $values.push:  .[2]
    }

    $.add_settersv($objects, $names, $values);
  }

  proto method add_settersv (|)
    is also<add-settersv>
  { * }

  multi method add_settersv (@objects, @names, @values, :$size is copy) {
    $size //= @objects.elems;
    if $size {
      X::GLib::InvalidSize.new(
        message =>
          "\@objects, \@names, and \@values must all have the same
          'size ({ $size })! They do not: { @objects.elems }, {
           @names.elems }, { @values.elems }!"
      ).throw unless @objects.elems == @names.elems == @values.elems == $size
    }

    samewith(
      $size,
      ArrayToCArray(GObject, @objects),
      ArrayToCArray(Str, @names),
      ArrayToCArray(GValue, @values)
    );
  }
  multi method add_settersv (
    Int()                    $n_setters,
    CArray[Pointer[GObject]] $objects,
    CArray[Str]              $names,
    CArray[GValue]           $values
  ) {
    my gint $n = $n_setters;

    adw_breakpoint_add_settersv(
      $!adw-b,
      $n,
      $objects,
      $names,
      $values
    );
  }

  method get_condition ( :$raw = False ) is also<get-condition> {
    propReturnObject(
      adw_breakpoint_get_condition($!adw-b),
      $raw,
      |Adwaita::Breakpoint::Condition.getTypePair
    );
  }

  method set_condition (AdwBreakpointCondition() $condition)
    is also<set-condition>
  {
    adw_breakpoint_set_condition($!adw-b, $condition);
  }

}
