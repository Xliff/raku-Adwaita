use v6.c;

use Adwaita::Raw::Types;

use GIO::Menu;
use GTK::Application:ver<4>;
use GTK::Box:ver<4>;
use GTK::Grid:Ver<4>;
use Adwaita::Button::Content;
use Adwaita::Button::Split;
use Adwaita::Clamp;
use Adwaita::Application;
use Adwaita::Status::Page;

my $a = GTK::Application.new(
  title => 'org.genex.adwaita.button.split',
  width => 500
);

my $menu;

$a.Activate.tap( -> *@a {
  Adwaita::Application.init;

  $menu = GIO::Menu.new(
    'Item ' «~« (1..3)
  );

  my $asp = Adwaita::Status::Page.new(
    title       => 'Buttons',
    description => 'Button helper widgets.'
  );

  my $c = Adwaita::Clamp.new(
    maximum-size         => 400,
    tightening-threshold => 300
  );

  my $b = GTK::Box.new-vbox;

  my $g = GTK::Grid.new(
    halign  => GTK_ALIGN_CENTER,
    spacing => 12
  );

  my @sb;
  @sb.append: Adwaita::Button::Split.new(
    icon-name    => 'document-open-symbolic',
    menu-model   => $menu,
    tooltip-text => 'Open'
  ) xx 2;
  @sb.tail.css-classes = <flat>;

  @sb.append: Adwaita::Button::Split.new(
    menu-model     => $menu,
    tooltip-text   => 'Open',
    use-underline => True
  ) xx 2;
  @sb.tail.css-classes = <flat>;

  @sb.append: Adwaita::Button::Split.new(
    child      => Adwaita::Button::Content.new(
      icon-name     => 'document-open-symbolic',
      label         => '_Open',
      use-underline => True
    ),
    menu-model => $menu
  ) xx 2;
  @sb.tail.css-classes = <flat>;

  # cw: Missing a split... go to bed!
  for (^3 X ^2).pairs {
    $g.attach(@sb[ .key ], .value.head, .value.tail)
  }

  .tail.add-child( .head ) for ($g, $b, $c, $asp, $a.window).rotor(2 => -1);

  $a.window.present;
});

$a.run;
