using Toybox.Application.Properties;
using Toybox.WatchUi;

import Toybox.Lang;


class BrailleTimeSettingsMenu extends WatchUi.Menu2 {

    function initialize() {

        Menu2.initialize({:title => SETTINGS_MENU_TITLE});

        var standardTimeEnabled = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_MODE_DEFAULT);
        addItem(new WatchUi.ToggleMenuItem(
            STANDARD_TIME_LABEL, 
            null, 
            STANDARD_TIME_PROPERTY, 
            standardTimeEnabled, 
            null
        ));

    }

}

class BrailleTimeSettingsDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {

        var id = item.getId();
        
        if (id.equals(STANDARD_TIME_PROPERTY) && item instanceof WatchUi.ToggleMenuItem) {
            Properties.setValue(STANDARD_TIME_PROPERTY, item.isEnabled());
        }

    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

}