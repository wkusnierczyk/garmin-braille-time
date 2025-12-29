using Toybox.Application;
using Toybox.Graphics;

import Toybox.Lang;


// Braille digits
const BRAILLE_DIGITS = Application.loadResource(Rez.JsonData.BrailleDigits) as Array<Dictionary>;

const BRAILLE_DIGITS_NAME_KEY = "name";
const BRAILLE_DIGITS_VALUE_KEY = "value";
const BRAILLE_DIGITS_DOTS_KEY = "dots";


// Geometry
const BRAILLE_GEOMETRY = Application.loadResource(Rez.JsonData.BrailleGeometry) as Dictionary;

const PIXELS_PER_UNIT_KEY = "PixelsPerUnit";
const DOT_RADIUS_UNTIS_KEY = "DotRadiusUnits";
const DOT_SPACE_UNITS_KEY = "DotSpaceUnits";
const CELL_SPACE_UNITS_KEY = "CellSpaceUnits";
const GROUP_SPACE_UNITS_KEY = "GroupSpaceUnits";

const PIXELS_PER_UNIT = BRAILLE_GEOMETRY[PIXELS_PER_UNIT_KEY] as Number;
const DOT_RADIUS_UNITS = BRAILLE_GEOMETRY[DOT_RADIUS_UNTIS_KEY] as Number;
const DOT_SPACE_UNITS = BRAILLE_GEOMETRY[DOT_SPACE_UNITS_KEY] as Number;
const CELL_SPACE_UNITS = BRAILLE_GEOMETRY[CELL_SPACE_UNITS_KEY] as Number;
const GROUP_SPACE_UNITS = BRAILLE_GEOMETRY[GROUP_SPACE_UNITS_KEY] as Number;

const HORIZONTAL_CELL_UNITS = 2 * 2 * DOT_RADIUS_UNITS + DOT_SPACE_UNITS;
const VERTICAL_CELL_UNITS = 3 * 2 * DOT_RADIUS_UNITS + 2 * DOT_SPACE_UNITS;
const HORIZONTAL_GROUP_UNITS = 2 * HORIZONTAL_CELL_UNITS + CELL_SPACE_UNITS;
const HORIZONTAL_TWO_GROUPS_UNITS = 2 * HORIZONTAL_GROUP_UNITS + 1 * GROUP_SPACE_UNITS;
const HORIZONTAL_THREE_GROUPS_UNITS = 3 * HORIZONTAL_GROUP_UNITS + 2 * GROUP_SPACE_UNITS;

const EDGE_MARGIN_PERCENT = 7;

// Colors
const HOUR_COLOR = Graphics.COLOR_WHITE;
const MINUTES_COLOR = Graphics.COLOR_LT_GRAY;
const SECONDS_COLOR = Graphics.COLOR_DK_GRAY;


// Settings
const SETTINGS_MENU_TITLE = Application.loadResource(Rez.Strings.SettingsMenuTitle);

const STANDARD_TIME_LABEL = Application.loadResource(Rez.Strings.StandardTimeMenuTitle);
const STANDARD_TIME_PROPERTY = "ShowStandardTime";
const STANDARD_TIME_MODE_DEFAULT = false;


// Layouts (only for standard time, which is fixed; base time layout is dynamic, depending on the base)
const STANDARD_TIME_LAYOUT_ID = "StandardTimeLayout";
