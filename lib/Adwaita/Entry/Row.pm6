use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Adwaita::Raw::Types;
use Adwaita::Raw::Entry::Row;

use Adwaita::Preferences::Row;

use GTK::Roles::Editable:ver<4>;

our subset AdwEntryRowAncestry is export of Mu
  where AdwEntryRow | GtkEditable | AdwPreferencesRowAncestry;

class Adwaita::Entry::Row is Adwaita::Preferences::Row {
  also does GTK::Roles::Editable;

  has AdwEntryRow $!adw-er is implementor;

  submethod BUILD ( :$adw-entry-row ) {
    self.setAdwEntryRow($adw-entry-row) if $adw-entry-row
  }

  method setAdwEntryRow (AdwEntryRowAncestry $_) {
    my $to-parent;

    $!adw-er = do {
      when AdwEntryRow {
        $to-parent = cast(AdwPreferencesRow, $_);
        $_;
      }

      when GtkEditable {
        $to-parent = cast(AdwPreferencesRow, $_);
        $!gtk-e    = $_;
        cast(AdwEntryRow, $_);
      }

      default {
        $to-parent = $_;
        cast(AdwEntryRow, $_);
      }
    }
    self.setAdwPreferencesRow($to-parent);
    self.roleInit-GtkEditable;
  }

  method Adwaita::Raw::Definitions::AdwEntryRow
    is also<AdwEntryRow>
  { $!adw-er }

  multi method new (
    $adw-entry-row where * ~~ AdwEntryRowAncestry,

    :$ref = True
  ) {
    return unless $adw-entry-row;

    my $o = self.bless( :$adw-entry-row );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-entry-row = adw_entry_row_new();

    my $o = $adw-entry-row ?? self.bless( :$adw-entry-row ) !! Nil;
    $o.setAttributes if $o && +%a;
    $o;
  }

  # Type: boolean
  method activates-default is rw  is g-property is also<activates_default> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('activates-default', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('activates-default', $gv);
      }
    );
  }

  # Type: PangoAttrList
  method attributes ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Pango::AttrList.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('attributes', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Pango::AttrList.getTypePair
        );
      },
      STORE => -> $, PangoAttrList() $val is copy {
        $gv.object = $val;
        self.prop_set('attributes', $gv);
      }
    );
  }

  # Type: boolean
  method enable-emoji-completion
    is rw
    is g-property
    is also<enable_emoji_completion>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('enable-emoji-completion', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('enable-emoji-completion', $gv);
      }
    );
  }

  # Type: GtkInputHints
  method input-hints ( :set(:$flags) = False )
    is rw
    is g-property
    is also<input_hints>
  {
    my $gv = GLib::Value.new-enum( GtkInputHints );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('input-hints', $gv);
        my $h = $gv.flags;
        return $h unless $flags;
        getFlags(GtkInputHintsEnum, $h);
      },
      STORE => -> $, Int() $val is copy {
        $gv.value-from-enum(GtkInputHints) = $val;
        self.prop_set('input-hints', $gv);
      }
    );
  }

  # Type: GtkInputPurpose
  method input-purpose ( :$enum = True )
    is rw
    is g-property
    is also<input_purpose>
  {
    my $gv = GLib::Value.new-enum( GtkInputPurpose );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('input-purpose', $gv);
        my $p = $gv.enum( GtkInputPurpose );
        return $p unless $enum;
        GtkInputPurposeEnum($p);
      },
      STORE => -> $, Int() $val is copy {
        $gv.value-from-enum( GtkInputPurpose ) = $val;
        self.prop_set('input-purpose', $gv);
      }
    );
  }

  # Type: boolean
  method show-apply-button is rw  is g-property is also<show_apply_button> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-apply-button', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-apply-button', $gv);
      }
    );
  }

  method Apply {
    self.connect($!adw-er, 'apply');
  }

  method Entry-Activated {
    self.connect($!adw-er, 'entry-activated');
  }

  method add_prefix (GtkWidget() $widget) is also<add-prefix> {
    #$widget.set-data('child-type', 'prefix');
    #self.prependBuildableWidget($widget);
    adw_entry_row_add_prefix($!adw-er, $widget);
  }

  method add_suffix (GtkWidget() $widget) is also<add-suffix> {
    #$widget.set-data('child-type', 'suffix');
    #self.appendBuildableWidget($widget);
    adw_entry_row_add_suffix($!adw-er, $widget);
  }

  method get_activates_default is also<get-activates-default> {
    so adw_entry_row_get_activates_default($!adw-er);
  }

  method get_attributes ( :$raw = False ) is also<get-attributes> {
    propReturnObject(
      adw_entry_row_get_attributes($!adw-er),
      $raw,
      |Pango::AttrList.getTypePair
    );
  }

  method get_enable_emoji_completion is also<get-enable-emoji-completion> {
    so adw_entry_row_get_enable_emoji_completion($!adw-er);
  }

  method get_input_hints ( :set(:$flags) = False ) is also<get-input-hints> {
    my $i = adw_entry_row_get_input_hints($!adw-er);
    return $i unless $flags;
    getFlags(GtkInputHintsEnum, $i);
  }

  method get_input_purpose ( :$enum = True ) is also<get-input-purpose> {
    my $p = adw_entry_row_get_input_purpose($!adw-er);
    return $p unless $enum;
    GtkInputPurposeEnum($p);
  }

  method get_show_apply_button is also<get-show-apply-button> {
    so adw_entry_row_get_show_apply_button($!adw-er);
  }

  method remove (GtkWidget() $widget) {
    adw_entry_row_remove($!adw-er, $widget);
  }

  method set_activates_default (Int() $activates)
    is also<set-activates-default>
  {
    my gboolean $a = $activates.so.Int;

    adw_entry_row_set_activates_default($!adw-er, $a);
  }

  method set_attributes (PangoAttrList() $attributes)
    is also<set-attributes>
  {
    adw_entry_row_set_attributes($!adw-er, $attributes);
  }

  method set_enable_emoji_completion (Int() $enable_emoji_completion)
    is also<set-enable-emoji-completion>
  {
    my gboolean $e = $enable_emoji_completion.so.Int;

    adw_entry_row_set_enable_emoji_completion($!adw-er, $e);
  }

  method set_input_hints (Int() $hints) is also<set-input-hints> {
    my GtkInputHints $h = $hints;

    adw_entry_row_set_input_hints($!adw-er, $h);
  }

  method set_input_purpose (Int() $purpose) is also<set-input-purpose> {
    my GtkInputPurpose $p = $purpose;

    adw_entry_row_set_input_purpose($!adw-er, $p);
  }

  method set_show_apply_button (Int() $show_apply_button)
    is also<set-show-apply-button>
  {
    my gboolean $s = $show_apply_button.so.Int;

    adw_entry_row_set_show_apply_button($!adw-er, $s);
  }

}

our subset AdwPasswordEntryRowAncestry is export of Mu
  where AdwPasswordEntryRow | AdwEntryRowAncestry;

class Adwaita::Entry::Row::Password is Adwaita::Entry::Row {
  has AdwPasswordEntryRow $!adw-per is implementor;

  submethod BUILD ( :$adw-entry-password ) {
    self.setAdwPasswordEntryRow($adw-entry-password) if $adw-entry-password
  }

  method setAdwPasswordEntryRow (AdwPasswordEntryRowAncestry $_) {
    my $to-parent;

    $!adw-per = do {
      when AdwPasswordEntryRow {
        $to-parent = cast(AdwPreferencesRow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(AdwPasswordEntryRow, $_);
      }
    }
    self.setAdwEntryRow($to-parent);
  }

  method Adwaita::Raw::Definitions::AdwPasswordEntryRow
    is also<AdwPasswordEntryRow>
  { $!adw-per }

  multi method new (
    $adw-entry-password where * ~~ AdwPasswordEntryRowAncestry,

    :$ref = True
  ) {
    return unless $adw-entry-password;

    my $o = self.bless( :$adw-entry-password );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $adw-entry-password = adw_password_entry_row_new();

    my $o = $adw-entry-password ?? self.bless( :$adw-entry-password ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

}
