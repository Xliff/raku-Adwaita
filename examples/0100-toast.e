use v6.c;

use Adwaita::Raw::Types;

use GTK::Application:ver<4>;
use GTK::Button:ver<4>;
use Adwaita::Action::Row;
use Adwaita::Clamp;
use Adwaita::Application;
use Adwaita::Status::Page;
use Adwaita::Toast;
use Adwaita::Toast::Overlay;
use Adwaita::Preferences::Group;

my ($tud, $ut) = (0, Nil);

my $a = GTK::Application.new(
  title => 'org.genex.adwaita.toast',
  width => 500
);

sub dismiss-ut {
  $ut.dismiss if $ut;
}

$a.Activate.tap( -> *@a {
  Adwaita::Application.init;

  my $to = Adwaita::Toast::Overlay.new;

  sub add-toast ($t) {
    $to.add-toast($t);
  }

  my $asp = Adwaita::Status::Page.new(
    icon-name   => 'widget-toast-symbolic',
    title       => 'Toasts',
    description => 'Transient in-app notifications.'
  );

  my $clamp  = Adwaita::Clamp.new(
    maximum-size         => 400,
    tightening-threshold => 300
  );

  my $pg = Adwaita::Preferences::Group.new;

  my $action-row1 = Adwaita::Action::Row.new(
    title => 'Simple Toast'
  );

  my $button1 = GTK::Button.new(
    valign => GTK_ALIGN_CENTER,
    label  => 'Show',
  );
  $button1.Clicked.tap( -> *@a {
    add-toast( Adwaita::Toast.new('Simple Toast') )
  });

  my $action-row2 = Adwaita::Action::Row.new(
    title => 'Toast With an Action',
  );
  my $button2 = GTK::Button.new(
    valign      => GTK_ALIGN_CENTER,
    icon-name   => 'user-trash-symbolic',
    css-classes => <flat>
  );
  $button2.Clicked.tap( -> *@a { dismiss-ut() });

  my $button3 = GTK::Button.new(
    valign      => GTK_ALIGN_CENTER,
    label       => 'Show'
  );
  $button3.Clicked.tap( -> *@a {
    $tud++;
    if $ut {
      $ut.title = qq:to/TITLE/;
        <span font_features='tnum=1'>{ $tud }</span> items deleted
        TITLE
    } else {
      $ut = Adwaita::Toast.new(
        '`Lorem Ipsum` deleted',

        priority     => ADW_TOAST_PRIORITY_HIGH,
        button-label => '_Undo',
      );

      $ut.Button-Clicked.tap( -> *@a { dismiss-ut() });

      $ut.Dismissed.tap( -> *@a {
        $ut  = Nil, $tud = 0;
      });

      add-toast($ut);
    }
  });

  my $action-row3 = Adwaita::Action::Row.new(
    title => 'Toast with a Long Title'
  );
  my $button4 = GTK::Button.new(
    valign => GTK_ALIGN_CENTER,
    label  => 'Show',
  );
  $button4.Clicked.tap( -> *@a {
    my $t = Adwaita::Toast.new( q:to/LONGTITLE/ );
      Lorem ipsum dolor sit amet
      consectetur adipiscing elit,
      sed do eiusmod tempor incididunt
      ut labore et dolore magnam aliquam
      quaerat voluptatem.
      LONGTITLE

    add-toast($t);
  });

  $action-row1.add-child($_) for $button1;

  $action-row2.add-child($_) for $button2,
                                 $button3;

  $action-row3.add-child($_) for $button4;

           $pg.add-child($_) for $action-row1,
                                 $action-row2,
                                 $action-row3;

        $clamp.add-child($_) for $pg;

          $asp.add-child($_) for $clamp;

           $to.add-child($_) for $asp;

     $a.window.add-child($_) for $to;

  $a.window.present;
});

$a.run;
