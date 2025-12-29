using Toybox.Application;
using Toybox.WatchUi;


class BrailleTimeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new BrailleTimeView() ];
    }

    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
    }

    function getSettingsView() {
        return [ new BrailleTimeSettingsMenu(), new BrailleTimeSettingsDelegate() ];
    }

}