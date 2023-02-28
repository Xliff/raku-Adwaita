class AdwApplicationClass is repr<CStruct> is export {
	has GtkApplicationClass $!parent_class;
	has gpointer            $!padding     ;
}

class AdwApplicationWindowClass is repr<CStruct> is export {
	has GtkApplicationWindowClass $!parent_class;
	has gpointer                  $!padding     ;
}

class AdwBinClass is repr<CStruct> is export {
	has GtkWidgetClass $!parent_class;
}

class AdwComboRowClass is repr<CStruct> is export {
	has AdwActionRowClass $!parent_class;
	has gpointer          $!padding     ;
}

class AdwEntryRowClass is repr<CStruct> is export {
	has AdwPreferencesRowClass $!parent_class;
}

class AdwExpanderRowClass is repr<CStruct> is export {
	has AdwPreferencesRowClass $!parent_class;
	has gpointer               $!padding     ;
}

class AdwPreferencesGroupClass is repr<CStruct> is export {
	has GtkWidgetClass $!parent_class;
	has gpointer       $!padding     ;
}

class AdwPreferencesPageClass is repr<CStruct> is export {
	has GtkWidgetClass $!parent_class;
	has gpointer       $!padding     ;
}

class AdwPreferencesRowClass is repr<CStruct> is export {
	has GtkListBoxRowClass $!parent_class;
	has gpointer           $!padding     ;
}

class AdwPreferencesWindowClass is repr<CStruct> is export {
	has AdwWindowClass $!parent_class;
	has gpointer       $!padding     ;
}

class AdwWindowClass is repr<CStruct> is export {
	has GtkWindowClass $!parent_class;
	has gpointer       $!padding     ;
}

