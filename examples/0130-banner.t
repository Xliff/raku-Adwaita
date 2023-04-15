use v6.c;

use Adwaita::Raw::Types;

use GTK::Application:ver<4>;
use GTK::CenterBox:ver<4>;
use GTK::Switch:ver<4>;
use Adwaita::Action::Row;
use Adwaita::Banner;
use Adwaita::Clamp;
use Adwaita::Entry::Row;
use Adwaita::Application;
use Adwaita::Status::Page;
use Adwaita::Toast::Overlay;
use Adwaita::Preferences::Group;

my $a = GTK::Application.new(
  title => 'org.genex.adwaita.banner',
  width => 500
);

$a.Activate.tap( -> *@a {
  Adwaita::Application.init;

  my $to = Adwaita::Toast::Overlay.new;

  my $cb = GTK::CenterBox.new(
    vexpand     => True,
    orientation => GTK_ORIENTATION_VERTICAL
  );

  my $b = Adwaita::Banner.new;
  $b.Button-Clicked.tap( -> *@a {
    $to.add-toast(
      Adwaita::Toast.new('Banner action triggered')
    );
  });

  my $asp = Adwaita::Status::Page.new(
    icon-name   => 'widget-banner-symbolic',
    title       => 'Banner',
    description => 'A bar with contextual information',
  );

  my $c = Adwaita::Clamp.new(
    maximum-size         => 400,
    tightening-threshold => 300
  );

  my $pg = Adwaita::Preferences::Group.new;

  my $gs1 = GTK::Switch.new(
    name   => 'show_banner_switch',
    valign => GTK_ALIGN_CENTER,
    active => True
  );

  my $ar = Adwaita::Action::Row.new(
    title              => 'Show Banner',
    activatable-widget => $gs1
  );

  my $aer1 = Adwaita::Entry::Row.new(
    name          => 'title_row',
    title         => 'Title',
    use-underline => True,
    text          => 'Metered connection - updates paused'
  );

  my $gs2 = GTK::Switch.new(
    name   => 'label_switch',
    valign => GTK_ALIGN_CENTER,
    active => True
  );

  my $aer2 = Adwaita::Entry::Row.new(
    name          => 'button_label_row',
    title         => 'Button',
    use-underline => True,
    text          => '_Network Settings'
  );

  $aer2.bind-swapped(
    'editable',
    %WIDGETS<label_switch>,
    'active',
    :create
  );

  $gs2.Activate.tap( -> *@a {
    $gs2.button-label = $gs2.button-label eq ''
      ?? $aer2.text
      !! Str
  } );

  %WIDGETS.gist.say;

  $b.bind-swapped(
    'revealed',
    %WIDGETS<show_banner_switch>,
    'active',
    :create, :bi
  );

  $b.bind-swapped(
    'title',
    %WIDGETS<title_row>,
    'text',
    :create
  );

  $b.bind-swapped(
    'button-label',
    %WIDGETS<button_label_row>,
    'text',
    :create
  );

    $ar.add-child($gs1);
  $aer2.add-child($gs2);
    $pg.add-child($_)    for $ar, $aer1, $aer2;
     $c.add-child($pg);
   $asp.add-child($c);

  $cb.start  = $b;
  $cb.center = $asp;

  $a.window.add($cb);
  $a.window.present;
});

$a.run;
