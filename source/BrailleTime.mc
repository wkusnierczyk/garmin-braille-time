using Toybox.Graphics;
using Toybox.System;

import Toybox.Lang;


class BrailleDigit {

    private const RADIUS_DEFAULT = PIXELS_PER_UNIT * DOT_RADIUS_UNITS;
    private const SPACE_DEFAULT = PIXELS_PER_UNIT * DOT_SPACE_UNITS;

    private var _raised as Array<Boolean>;
    private var _radius = RADIUS_DEFAULT;
    private var _space = SPACE_DEFAULT;
    private var _color = HOUR_COLOR;

    function initialize(value as Number) {
        var digit = BRAILLE_DIGITS[value] as Dictionary;
        _raised = digit[BRAILLE_DIGITS_DOTS_KEY] as Array<Boolean>;
    }

    function withRadius(radius as Number) as BrailleDigit {
        _radius = radius;
        _space = Math.ceil(radius  * DOT_SPACE_UNITS / DOT_RADIUS_UNITS);
        return self;
    }

    function withPixelsPerUnit(pixelsPerUnit as Number) as BrailleDigit {
        _space = Math.ceil(DOT_SPACE_UNITS * pixelsPerUnit);
        _radius = Math.ceil(DOT_RADIUS_UNITS * pixelsPerUnit);
        return self;
    }

    function withColor(color as Graphics.ColorValue) as BrailleDigit {
        _color = color;
        return self;
    }

    function draw(dc, leftX as Number, topY as Number) {

        leftX += _radius;
        topY += _radius;

        var currentX = leftX;
        var currentY = topY;

        dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
        for (var dot = 0; dot < 6; ++dot) {
            if (_raised[dot]) {
                dc.drawCircle(currentX, currentY, _radius);
                dc.fillCircle(currentX, currentY, _radius);
            } else {
                dc.drawCircle(currentX, currentY, _radius);
            }
            if (dot == 2) {
                currentX += 2 * _radius + _space;
                currentY = topY;
            } else {
                currentY += 2 * _radius + _space;
            }
        }

    }

}


class BrailleTime {

    private var _clockTime;
    private var _hour;
    private var _minutes;
    private var _seconds;

    function initialize(clockTime as System.ClockTime) {
        _clockTime = clockTime;
        _hour = _clockTime.hour;
        _minutes = _clockTime.min;
        _seconds = _clockTime.sec;
    }

    function draw(dc) {

        var width = dc.getWidth();
        var height = dc.getHeight();
        var widthUnits = HORIZONTAL_THREE_GROUPS_UNITS;
        var heightUnits = VERTICAL_CELL_UNITS;

        var pixelsPerUnit = Math.ceil((1 - 2 * EDGE_MARGIN_PERCENT / 100) * width / widthUnits).toNumber();
        // var pixelsPerUnit = Math.ceil((width - 20) / widthUnits).toNumber();

        var leftX = Math.floor((width - pixelsPerUnit * widthUnits) / 2).toNumber();
        var topY = Math.floor((height - pixelsPerUnit * heightUnits) / 2).toNumber();

        new BrailleDigit(_tensOf(_hour))
            .withPixelsPerUnit(pixelsPerUnit)
            .withColor(HOUR_COLOR)
            .draw(dc, leftX, topY);
        leftX += (HORIZONTAL_CELL_UNITS + CELL_SPACE_UNITS) * pixelsPerUnit;
        new BrailleDigit(_onesOf(_hour))
            .withPixelsPerUnit(pixelsPerUnit)
            .withColor(HOUR_COLOR)
            .draw(dc, leftX, topY);
        leftX += (HORIZONTAL_CELL_UNITS + GROUP_SPACE_UNITS) * pixelsPerUnit;
        new BrailleDigit(_tensOf(_minutes))
            .withPixelsPerUnit(pixelsPerUnit)
            .withColor(MINUTES_COLOR)
            .draw(dc, leftX, topY);
        leftX += (HORIZONTAL_CELL_UNITS + CELL_SPACE_UNITS) * pixelsPerUnit;
        new BrailleDigit(_onesOf(_minutes))
            .withPixelsPerUnit(pixelsPerUnit)
            .withColor(MINUTES_COLOR)
            .draw(dc, leftX, topY);
        leftX += (HORIZONTAL_CELL_UNITS + GROUP_SPACE_UNITS) * pixelsPerUnit;
        new BrailleDigit(_tensOf(_seconds))
            .withPixelsPerUnit(pixelsPerUnit)
            .withColor(SECONDS_COLOR)
            .draw(dc, leftX, topY);
        leftX += (HORIZONTAL_CELL_UNITS + CELL_SPACE_UNITS) * pixelsPerUnit;
        new BrailleDigit(_onesOf(_seconds))
            .withPixelsPerUnit(pixelsPerUnit)
            .withColor(SECONDS_COLOR)
            .draw(dc, leftX, topY);

    }

    private function _tensOf(number as Number) as Number {
        return Math.floor(number / 10);
    }

    private function _onesOf(number as Number) as Number {
        return number % 10;
    }

}
