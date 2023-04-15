use v6.c;

use Adwaita::Raw::Types;

use GTK::Application;
use GLib::Object::Closure:ver<4>;
use Adwaita::Action::Row;
use Adwaita::Combo::Row;
use Adwaita::Flap;
use Adwaita::ListModel::Enum;
use Adwaita::Application;
use Adwaita::Preferences::Group;
use Adwaita::Preferences::Page;
use GTK::Box:ver<4>;
use GTK::Button::Toggle:ver<4>;
use GTK::HeaderBar:ver<4>;
use GTK::Separator:ver<4>;
use GTK::Stack::Sidebar:ver<4>;
use GTK::Stack:ver<4>;
use GTK::Switch:ver<4>;

my $a = GTK::Application.new(
  title  => 'org.genex.adwaita.flap',
  width  => 640,
  height => 480
);

sub enum-name ($e) {
  $e.Str.split('_').tail.lc.tc
}

$a.Activate.tap( -> *@a {
  Adwaita::Application.init;

  my $box1 = GTK::Box.new-vbox;
  my $hb   = GTK::HeaderBar.new;
  my $tb1  = GTK::Button::Toggle.new(
    name      => 'reveal_btn_start',
    icon-name => 'view-sidebar-start-symbolic'
  );
  my $tb2  = GTK::Button::Toggle.new(
    name      => 'reveal_btn_end',
    icon-name => 'view-sidebar-end-symbolic'
  );
  my $sep  = GTK::Separator.new;

  my $s    = GTK::Stack.new(
    vexpand       => True,
    width-request => 360
  );

  my $ssb  = GTK::Stack::Sidebar.new(
    stack         => $s,
    width-request => 200,
    css-classes   => <background>
  );

  my $f    = Adwaita::Flap.new(
    expand    => True,
    flap      => $ssb,
    separator => $sep,
    content   => $s
  );

  $s.notify('visible-child').tap( -> *@a {
    $f.reveal-flap = False if $f.folded && $f.locked.not;
  });

  $tb1.bind-swapped('active', $f, 'reveal-flap', :create, :bi);
  $tb2.bind-swapped('active', $f, 'reveal-flap', :create, :bi);

  $box1.add-child($_) for $hb, $f;
  $hb.prepend-child($tb1);
  $hb.add-child($tb2);

  my @sp;

  my $pp1  = Adwaita::Preferences::Page.new;
  my $pg1  = Adwaita::Preferences::Group.new;
  my $aem  = Adwaita::ListModel::Enum.new(
    Adwaita::Enums::FlapFoldPolicy.get_type
  );

  my $cr1  = Adwaita::Combo::Row.new(
    title      => 'Fold Policy',
    model      => $aem
  );
  $cr1.bind-swapped('selected', $f, 'fold-policy', :create, :bi);
  my $clo  = GLib::Object::Closure::C.new-object(
   $cr1,
   -> *@a {
     CATCH {
       default { .message.say; .backtrace.concice.say }
     }

     say "A: { @a.gist }";

     # my $li = Adwaita::ListModel::Enum::Item.new(
     #   cast(AdwEnumListItem, @a.head)
     # );
     #
     # enum-name($li.value);
  });
  my $ex1  = GTK::Expression::Closure.new(
    $clo,
    type   => G_TYPE_STRING#,
    #params => ( GTK::Expression.new )
  );
  $cr1.expression = $ex1;

  my $gs1  = GTK::Switch.new(
    name => 'locked_switch',
    valign => GTK_ALIGN_CENTER
  );
  $f.bind-swapped('locked', $gs1, 'active', :create);
  my $ar1  = Adwaita::Action::Row.new(
    title              => 'Locked',
    subtitle           => "Sidebar visibility doesn't change when fold {
                           ''}state changes",
    activatable-widget => $gs1
  );

  my $pp2  = Adwaita::Preferences::Page.new;
  my $pg2  = Adwaita::Preferences::Group.new;

  $ar1.add-child($gs1);
  $pg1.add-child($_) for $cr1, $ar1;
  $pp1.add($pg1);
  $s.add-titled($pp1, 'folding', 'Folding');

  my $box2 = GTK::Box.new(
    valign      => GTK_ALIGN_CENTER,
    css-classes => <linked>
  );
  my $ar2  = Adwaita::Action::Row.new(
    title => 'Flap Position'
  );
  my $tb3  = GTK::Button::Toggle.new(
    label => 'Start',
    active => True
  );
  $tb3.Toggled.tap( -> *@a {
    ($tb1.visible, $tb2.visible, $f.flap-position) = $tb3.active
      ?? (True,  False, GTK_PACK_START)
      !! (False, True,  GTK_PACK_END);
  });

  my $tb4  = GTK::Button::Toggle.new(
    label => 'End',
    group => $tb3
  );
  my $aem2 = Adwaita::ListModel::Enum.new(
    Adwaita::Enums::FlapTransitionType.get_type
  );
  my $ex2  = GTK::Expression::Property.new(
    Adwaita::ListModel::Enum::Item.get_type,
    'name'
  );
  my $cr2  = Adwaita::Combo::Row.new(
    model      => $aem2,
    title      => 'Transition Type',
    expression => $ex2
  );
  $cr2.bind-swapped('selected', $f, 'transition-type', :create, :bi);

  $box2.add-child($_) for $tb3, $tb4;
  $ar2.add-child($box2);
  $pg2.add-child($_) for $ar2, $cr2;
  $pp2.add($pg2);
  $s.add-titled($pp2, 'layout', 'Layout');

  my $pp3  = Adwaita::Preferences::Page.new;
  my $pg3  = Adwaita::Preferences::Group.new;
  my $gs2  = GTK::Switch.new(
    name   => 'modal_switch',
    valign => GTK_ALIGN_CENTER,
    active => True
  );
  my $ar3  = Adwaita::Action::Row.new(
    title              => 'Modal',
    subtitle           => "Clicking outside the sidebar or pressing Esc will {
                           '' }close it when folded",
    subtitle-lines     => 2,
    activatable-widget => $gs2
  );
  my $gs3  = GTK::Switch.new(
    name   => 'swipe_to_open',
    valign => GTK_ALIGN_CENTER,
    active => True
  );
  my $ar4  = Adwaita::Action::Row.new(
    title              => 'Swipe to Open',
    activatable-widget => $gs3
  );
  my $gs4  = GTK::Switch.new(
    name   => 'swipe_to_close',
    valign => GTK_ALIGN_CENTER,
    active => True
  );
  my $ar5  = Adwaita::Action::Row.new(
    title              => 'Swipe to Close',
    activatable-widget => $gs4
  );
  $f.bind-swapped('modal',          $gs2, 'active', :create);
  $f.bind-swapped('swipe-to-open',  $gs3, 'active', :create);
  $f.bind-swapped('swipe-to-close', $gs4, 'active', :create);

  $ar3.add-child($gs2);
  $ar4.add-child($gs3);
  $ar5.add-child($gs4);
  $pg3.add-child($_) for $ar3, $ar4, $ar5;
  $pp3.add($pg3);
  $s.add-titled($pp3, 'interaction', 'Interaction');

  $a.window.modal = True;
  $a.window.add($box1);
  $a.window.present;
});

$a.run;
