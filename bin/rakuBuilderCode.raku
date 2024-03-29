use XML::Actions;

class GTK::Builder::Generator is XML::Actions::Work {

  method is-child-property ($node) {
    $node.name eq 'property' && $node.attribs.values.first('child');
  }

  method getLastObject ($parent-path) {
    with $parent-path.map( *.name ).first('object', :k, :end) {
      if $parent-path[ $_ ] -> $lo {
        return $lo;
      }
    }
  }

  method object:start (Array $parent-path, :$class, :$id) {
    my $o        = $parent-path.tail;
    my $var-name = $class.comb( /<[A..Z]>/ ).join.lc;

    $o.data<properties>.push: %(
      name  => 'name',
      value => $id
    ) if $id;

    $o.data<type> = $class;

    $var-name ~= ++%!class-manifest{$var-name};
    $o.data<variable-name> = $var-name;
  }

  method property:start (Array $parent-path, :$name) {
    return if $name eq 'child';

    self.getLastObject($parent-path).data<properties>.push:
      %( :$name, value => '')
  }

  method xml:text (Array $parent-path, Str $text) {
    return if self.is-child-property($parent-path.tail);

    given $parent-path.tail.name {
      when 'property' {
        self.getLastObject($parent-path).data<properties>.tail<value> =
          $text;
      }
    }
  }

  method object:end (Array $parent-path) {
    $parent-path.tail.data<childen> = $parent-path.tail.elements(
      TAG     => 'object',
      RECURSE => 1
    ).map({ [ .data<variable-name>, .data<type>] });

    $parent-path.tail.data<properties> .= grep( *<name> ne 'adjustment' );
  }

  method interface:end (Array $parent-path) {
    .gist.say for $parent-path.tail.elements( TAG => 'object', RECURSE => 100, NEST => 1).map( *.data )
  }

}

my $ui;

sub MAIN {
  my $a = XML::Actions.new;
  $a.process-string($ui, actions => GTK::Builder::Generator.new);
}

INIT {
  $ui = q:to/UI/;
    <?xml version="1.0" encoding="UTF-8"?>
    <interface>
      <requires lib="gtk" version="4.0"/>
      <requires lib="libadwaita" version="1.0"/>
      <template class="AdwDemoPageAnimations" parent="AdwBin">
        <property name="child">
          <object class="GtkScrolledWindow">
            <property name="hscrollbar-policy">never</property>
            <property name="child">
              <object class="GtkBox">
                <property name="orientation">vertical</property>
                <property name="valign">center</property>
                <style>
                  <class name="timed-animation-page"/>
                </style>
                <child>
                  <object class="GtkBox">
                    <property name="orientation">vertical</property>
                    <child>
                      <object class="AdwClamp">
                        <property name="maximum-size">400</property>
                        <property name="tightening-threshold">300</property>
                        <property name="child">
                          <object class="AdwBin" id="timed_animation_sample">
                            <property name="margin-bottom">36</property>
                            <property name="child">
                              <object class="AdwBin" id="timed_animation_widget">
                                <property name="halign">center</property>
                                <property name="valign">center</property>
                                <property name="name">animation-sample</property>
                              </object>
                            </property>
                          </object>
                        </property>
                      </object>
                    </child>
                    <child>
                      <object class="GtkLabel">
                        <property name="label" translatable="yes">Animations</property>
                        <property name="wrap">True</property>
                        <property name="wrap-mode">word-char</property>
                        <property name="justify">center</property>
                        <style>
                          <class name="title"/>
                          <class name="title-1"/>
                        </style>
                      </object>
                    </child>
                    <child>
                      <object class="GtkLabel">
                        <property name="label" translatable="yes">Simple transitions.</property>
                        <property name="justify">center</property>
                        <property name="use_markup">true</property>
                        <property name="wrap">True</property>
                        <style>
                          <class name="body"/>
                          <class name="description"/>
                        </style>
                      </object>
                    </child>
                  </object>
                </child>
                <child>
                  <object class="GtkBox" id="timed_animation_button_box">
                    <property name="valign">center</property>
                    <property name="halign">center</property>
                    <property name="margin-top">30</property>
                    <property name="margin-bottom">30</property>
                    <property name="spacing">18</property>
                    <child>
                      <object class="GtkButton">
                        <property name="icon-name">media-skip-backward-symbolic</property>
                        <property name="valign">center</property>
                        <binding name="sensitive">
                          <closure type="gboolean" function="timed_animation_can_reset">
                            <lookup name="state" type="AdwAnimation">
                              <lookup name="timed-animation">AdwDemoPageAnimations</lookup>
                            </lookup>
                            <lookup name="state" type="AdwAnimation">
                              <lookup name="spring-animation">AdwDemoPageAnimations</lookup>
                            </lookup>
                          </closure>
                        </binding>
                        <signal name="clicked" handler="timed_animation_reset" swapped="true"/>
                        <style>
                          <class name="circular"/>
                          <class name="flat"/>
                        </style>
                      </object>
                    </child>
                    <child>
                      <object class="GtkButton">
                        <binding name="icon-name">
                          <closure type="gchararray" function="get_play_pause_icon_name">
                            <lookup name="state" type="AdwAnimation">
                              <lookup name="timed-animation">AdwDemoPageAnimations</lookup>
                            </lookup>
                            <lookup name="state" type="AdwAnimation">
                              <lookup name="spring-animation">AdwDemoPageAnimations</lookup>
                            </lookup>
                          </closure>
                        </binding>
                        <property name="width-request">48</property>
                        <property name="height-request">48</property>
                        <signal name="clicked" handler="timed_animation_play_pause" swapped="true"/>
                        <style>
                          <class name="circular"/>
                          <class name="suggested-action"/>
                        </style>
                      </object>
                    </child>
                    <child>
                      <object class="GtkButton">
                        <property name="icon-name">media-skip-forward-symbolic</property>
                        <property name="valign">center</property>
                        <binding name="sensitive">
                          <closure type="gboolean" function="timed_animation_can_skip">
                            <lookup name="state" type="AdwAnimation">
                              <lookup name="timed-animation">AdwDemoPageAnimations</lookup>
                            </lookup>
                            <lookup name="state" type="AdwAnimation">
                              <lookup name="spring-animation">AdwDemoPageAnimations</lookup>
                            </lookup>
                          </closure>
                        </binding>
                        <signal name="clicked" handler="timed_animation_skip" swapped="true"/>
                        <style>
                          <class name="circular"/>
                          <class name="flat"/>
                        </style>
                      </object>
                    </child>
                  </object>
                </child>
                <child>
                  <object class="AdwPreferencesGroup">
                    <child>
                      <object class="GtkStackSwitcher">
                        <property name="stack">animation_preferences_stack</property>
                        <property name="margin-bottom">32</property>
                        <property name="halign">center</property>
                      </object>
                    </child>
                  </object>
                </child>
                <child>
                  <object class="AdwClamp">
                    <property name="maximum-size">400</property>
                    <property name="tightening-threshold">300</property>
                    <property name="child">
                      <object class="GtkStack" id="animation_preferences_stack">
                        <signal name="notify::visible-child-name" handler="timed_animation_reset" swapped="true"/>
                        <child>
                          <object class="GtkStackPage">
                            <property name="title" translatable="yes">Timed</property>
                            <property name="name">Timed</property>
                            <property name="child">
                              <object class="AdwPreferencesGroup">
                                <child>
                                  <object class="AdwComboRow" id="timed_animation_easing">
                                    <property name="title" translatable="yes">Easing</property>
                                    <property name="model">
                                      <object class="AdwEnumListModel">
                                        <property name="enum-type">AdwEasing</property>
                                      </object>
                                    </property>
                                    <property name="expression">
                                      <closure type="gchararray" function="animations_easing_name"/>
                                    </property>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Duration</property>
                                    <child>
                                      <object class="GtkSpinButton" id="timed_animation_duration">
                                        <property name="valign">center</property>
                                        <property name="numeric">True</property>
                                        <property name="adjustment">
                                          <object class="GtkAdjustment">
                                            <property name="lower">100</property>
                                            <property name="upper">4000</property>
                                            <property name="value">500</property>
                                            <property name="page-increment">100</property>
                                            <property name="step-increment">50</property>
                                          </object>
                                        </property>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Repeat Count</property>
                                    <child>
                                      <object class="GtkSpinButton" id="timed_animation_repeat_count">
                                        <property name="valign">center</property>
                                        <property name="numeric">True</property>
                                        <property name="adjustment">
                                          <object class="GtkAdjustment">
                                            <property name="lower">0</property>
                                            <property name="upper">10</property>
                                            <property name="value">1</property>
                                            <property name="page-increment">1</property>
                                            <property name="step-increment">1</property>
                                          </object>
                                        </property>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Reverse</property>
                                    <property name="activatable_widget">timed_animation_reverse</property>
                                    <child>
                                      <object class="GtkSwitch" id="timed_animation_reverse">
                                        <property name="valign">center</property>
                                        <property name="state">False</property>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Alternate</property>
                                    <property name="activatable_widget">timed_animation_alternate</property>
                                    <child>
                                      <object class="GtkSwitch" id="timed_animation_alternate">
                                        <property name="valign">center</property>
                                        <property name="state">False</property>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                              </object>
                            </property>
                          </object>
                        </child>
                        <child>
                          <object class="GtkStackPage">
                            <property name="title" translatable="yes">Spring</property>
                            <property name="name">Spring</property>
                            <property name="child">
                              <object class="AdwPreferencesGroup">
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Initial Velocity</property>
                                    <child>
                                      <object class="GtkSpinButton" id="spring_animation_velocity">
                                        <property name="valign">center</property>
                                        <property name="numeric">True</property>
                                        <property name="adjustment">
                                          <object class="GtkAdjustment">
                                            <property name="lower">-1000</property>
                                            <property name="upper">1000</property>
                                            <property name="value">0</property>
                                            <property name="page-increment">10</property>
                                            <property name="step-increment">1</property>
                                          </object>
                                        </property>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Damping</property>
                                    <child>
                                      <object class="GtkSpinButton" id="spring_animation_damping">
                                        <property name="valign">center</property>
                                        <property name="numeric">True</property>
                                        <property name="adjustment">
                                          <object class="GtkAdjustment">
                                            <property name="lower">0</property>
                                            <property name="upper">1000</property>
                                            <property name="value">10</property>
                                            <property name="page-increment">10</property>
                                            <property name="step-increment">1</property>
                                          </object>
                                        </property>
                                        <signal name="value-changed" handler="notify_spring_params_change" swapped="yes"/>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Mass</property>
                                    <child>
                                      <object class="GtkSpinButton" id="spring_animation_mass">
                                        <property name="valign">center</property>
                                        <property name="numeric">True</property>
                                        <property name="adjustment">
                                          <object class="GtkAdjustment">
                                            <property name="lower">0</property>
                                            <property name="upper">100</property>
                                            <property name="value">1</property>
                                            <property name="page-increment">10</property>
                                            <property name="step-increment">1</property>
                                          </object>
                                        </property>
                                        <signal name="value-changed" handler="notify_spring_params_change" swapped="yes"/>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Stiffness</property>
                                    <child>
                                      <object class="GtkSpinButton" id="spring_animation_stiffness">
                                        <property name="valign">center</property>
                                        <property name="numeric">True</property>
                                        <property name="adjustment">
                                          <object class="GtkAdjustment">
                                            <property name="lower">0</property>
                                            <property name="upper">1000</property>
                                            <property name="value">100</property>
                                            <property name="page-increment">10</property>
                                            <property name="step-increment">1</property>
                                          </object>
                                        </property>
                                        <signal name="value-changed" handler="notify_spring_params_change" swapped="yes"/>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Epsilon</property>
                                    <child>
                                      <object class="GtkSpinButton" id="spring_animation_epsilon">
                                        <property name="valign">center</property>
                                        <property name="numeric">True</property>
                                        <property name="digits">5</property>
                                        <property name="adjustment">
                                          <object class="GtkAdjustment">
                                            <property name="lower">0.0001</property>
                                            <property name="upper">0.01</property>
                                            <property name="value">0.001</property>
                                            <property name="page-increment">0.001</property>
                                            <property name="step-increment">0.001</property>
                                          </object>
                                        </property>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                                <child>
                                  <object class="AdwActionRow">
                                    <property name="title" translatable="yes">Clamp</property>
                                    <property name="activatable-widget">spring_animation_clamp_switch</property>
                                    <child>
                                      <object class="GtkSwitch" id="spring_animation_clamp_switch">
                                        <property name="valign">center</property>
                                      </object>
                                    </child>
                                  </object>
                                </child>
                              </object>
                            </property>
                          </object>
                        </child>
                      </object>
                    </property>
                  </object>
                </child>
              </object>
            </property>
          </object>
        </property>
      </template>
    </interface>
    UI

}
