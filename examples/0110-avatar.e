use v6.c;

use Adwaita::Raw::Types;
# cw: Needs to be moved to GIO::Raw::Types!
use GIO::Raw::FileAttributeTypes;

use GTK::Adjustment;
use GTK::Application;
use GTK::Box;
use GTK::Button;
use GTK::Dialog::File;
use GTK::Image;
use GTK::Label;
use GTK::ListBox;
use GTK::ScrolledWindow;
use GTK::Switch;
use GTK::Button::Spin;
use Adwaita::Main;
use Adwaita::Action::Row;
use Adwaita::Avatar;
use Adwaita::Clamp;
use Adwaita::Entry::Row;
use Adwaita::Preferences::Group;

my $a = GTK::Application.new(
  title => 'org.genex.adwaita.avatar',
  width => 500
);

sub create-random-name {
  [~](
    <
      Adam    Adrian    Anna       Charlotte Frédérique Ilaria
      Jakub   Jennyfer  Julia      Justin    Mario      Miriam
      Mohamed Nourimane Owen       Peter     Petra      Rachid
      Rebecca Sarah     Thibault   Wolfgang
    >.pick,

    ' ',

    <
      Bailey    Berat   Chen       Farquharson Ferber Franco
      Galinier  Han     Lawrence   Lepied      Lopez  Mariotti
      Rossi     Urasawa Zwickelman
    >.pick
  );
}

my ($Contacts, $trash-action);

sub avatar-open ($w) {
  my $root =
  my $fd   = GTK::Dialog::File.new( title => 'Select an Avatar' );

  $fd.open($w.root, -> *@a {
    with my $file = $fd.open-finish( |@a[^2] ) {
      if .query-info(
        fAttrVal(G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME),
        G_FILE_QUERY_INFO_NONE
      ) -> $i {
        %WIDGETS<file_chooser_label>.label = $i.display-name;
      }
      $trash-action.enabled = True;
      my $texture = GDK::Texture.new-from-file($_);
      say "ERROR - Failed to create texture from file: { $ERROR.message }"
        if $ERROR;
      %WIDGETS<avatar>.custom-image = $texture if $texture;
    }
  });
}

sub avatar-remove {
  %WIDGETS<file_chooser_label>.label = '(None)';
  $trash-action.enabled = False,
  %WIDGETS<avatar>.unsetCustomImage;
}

sub populate-contacts {
  for ^30 {
    my $name    = create-random-name;
    my $contact = Adwaita::Action::Row.new;
    my $avatar  = Adwaita::Avatar.new(40, $name, True);

    ( .margin-top, .margin-bottom ) = 12 xx 2 given $avatar;
    $contact.title = $name;
    $contact.add-prefix($avatar);
    $Contacts.append($contact);
  }
}

$a.Activate.tap( -> *@a {
  Adwaita::Main.init;

  my $sw = GTK::ScrolledWindow.new(
    hscrollbar-policy => GTK_POLICY_NEVER
  );

  given ( my $box1 = GTK::Box.new-vbox ) {
    .valign      = GTK_ALIGN_START;
    .css-classes = <avatar-page>
  };
  $sw.add-child($box1);

  my $box2 = GTK::Box.new-vbox;
  $box1.add($box2);

  my $size-adjust = GTK::Adjustment.new(
    lower => 24,
    upper => 320,
    value => 128,
    page-increment => 8,
    step-increment => 8
  );

  my $show-initials = GTK::Switch.new(
    valign => GTK_ALIGN_CENTER,
    active => True
  );

  my $size = GTK::Button::Spin.new(
    name       => 'size',
    numeric    => True,
    adjustment => $size-adjust,
  );
  $size.set-value(128);

  my $text = Adwaita::Entry::Row.new(
    name  => 'text',
    title => 'Text'
  );

  given my $avatar = Adwaita::Avatar.new(
    name          => 'avatar',
    valign        => GTK_ALIGN_CENTER,
    margin-bottom => 36,
    # cw: Size not setting via adjustment or spinbutton but bind works?
    size          => 128
  ) {
    .bind-swapped('text',          $text,                    :create);
    .bind-swapped('size',          $size,          'value',  :create);
    .bind-swapped('show-initials', $show-initials, 'active', :create);
  }

  my $label1 = GTK::Label.new(
    label       => 'Avatar',
    wrap        => True,
    wrap-mode   => GTK_WRAP_WORD_CHAR,
    justify     => GTK_JUSTIFY_CENTER,
    css-classes => <title title-1>
  );

  my $label2 = GTK::Label.new(
    label       => 'A user avatar with generated fallback.',
    justify     => GTK_JUSTIFY_CENTER,
    use-markup  => True,
    wrap        => True,
    css-classes => <body description>
  );

  my $clamp = Adwaita::Clamp.new(
    maximum-size         => 400,
    tightening-threshold => 300
  );

  my $box3 = GTK::Box.new-vbox(12);
  $box3.valign = GTK_ALIGN_CENTER;
  $clamp.add-child($box3);

  $box2.add-child($_) for $avatar, $label1, $label2, $clamp;

  my $group1 = Adwaita::Preferences::Group.new;
  $box3.add-child($group1);

  my $si-a-row = Adwaita::Action::Row.new(
    title              => 'Show Initials',
    activatable-widget => $show-initials
  );
  $si-a-row.add-child($show-initials);

  my $trash-button = GTK::Button.new(
    valign      => GTK_ALIGN_CENTER,
    icon-name   => 'user-trash-symbolic',
    css-classes => <flat>

  );
  ( $trash-action = $trash-button.Clicked ).tap( -> *@a {
    avatar-remove;
  });

  my $file-button = GTK::Button.new(
    valign => GTK_ALIGN_CENTER
  );
  $file-button.Clicked.tap( -> *@a {
    avatar-open(@a.head);
  });

  my $f-a-row = Adwaita::Action::Row.new(
    title              => 'File',
    activatable-widget => $file-button
  );

  my $box4 = GTK::Box.new-hbox(6);

  my $image = GTK::Image.new(
    icon-name => 'document-open-symbolic'
  );

  my $label3 = GTK::Label.new(
    name      =>'file_chooser_label',
    ellipsize => PANGO_ELLIPSIZE_MIDDLE
  );
  $box4.add-child($_) for $image, $label3;
  $file-button.add-child($box4);

  $f-a-row.add-child($_) for $file-button, $trash-button;

  my $s-a-row = Adwaita::Action::Row.new(
    title => 'Size'
  );
  $s-a-row.add-child($size);

  my $export-button = GTK::Button.new(
    valign      => GTK_ALIGN_CENTER,
    icon-name   => 'avatar-save-symbolic',
    css-classes => <flat>
  );
  $export-button.Clicked.tap( -> *@a {
    my $fd = GTK::Dialog::File.new( title => 'Save Avatar' );
    $fd.save($export-button.root, -> *@a {
      with $fd.save-finish( |@a[^2] ) {
        %WIDGETS<avatar>.draw-to-texture.save-to-png;
      }
    })
  });

  my $e-a-row = Adwaita::Action::Row.new(
    title => 'Export to File'
  );
  $e-a-row.add-child($export-button);

  $Contacts = GTK::ListBox.new(
    name           => 'contacts',
    selection-mode => GTK_SELECTION_NONE,
    css-classes    => <boxed-list>
  );

  $group1.add-child($_) for $text,
                            $si-a-row,
                            $f-a-row,
                            $s-a-row,
                            $e-a-row,
                            $Contacts;

  populate-contacts;
  avatar-remove;
  $text.text = create-random-name;

  $a.window.add($sw);
  $a.window.present;
});

$a.run;
