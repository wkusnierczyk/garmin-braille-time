using Toybox.Application.Properties;
using Toybox.Graphics;
using Toybox.System;
using Toybox.WatchUi;

import Toybox.Lang;


class BrailleTimeView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onUpdate(dc) {

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        var clockTime = System.getClockTime();

        _drawStandardTime(dc, clockTime);
        View.onUpdate(dc);

        new BrailleTime(clockTime)
            .draw(dc);

    }

    private function _drawStandardTime(dc as Graphics.Dc or Null, clockTime as System.ClockTime) {
        var standardTimeEnabled = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_MODE_DEFAULT);
        if (standardTimeEnabled) {
            var standardTime = Lang.format("$1$:$2$:$3$", [
                clockTime.hour.format("%d"),
                clockTime.min.format("%02d"),
                clockTime.sec.format("%02d")
            ]);
            var standardTimeView = View.findDrawableById(STANDARD_TIME_LAYOUT_ID) as WatchUi.Text;
            standardTimeView.setText(standardTime);
        }
    }

}