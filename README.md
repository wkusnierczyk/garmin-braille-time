# Garmin Braille Time

A minimalist, elegant, nerdy Garmin Connect IQ watch face that displays the current time using Braille digits.

![](resources/graphics/BrailleTimeHero-small.png)

Available from the [Garmin Connect IQ Developer portal](https://apps.garmin.com/apps/b9312f59-3767-4f2d-8da3-475135ce17dd).

> **Note**  
> Swatch Time is part of a [collection of unconventional Garmin watch faces](https://github.com/wkusnierczyk/garmin-watch-faces). It has been developed for fun, as a proof of concept, and as a learning experience.
> It is shared _as is_ as an open source project, with no commitment to long term maintenance and further feature development.
>
> Please use [issues](https://github.com/wkusnierczyk/garmin-braille-time/issues) to provide bug reports or feature requests.  
> Please use [discussions](https://github.com/wkusnierczyk/garmin-braille-time/discussions) for any other comments.
>
> All feedback is wholeheartedly welcome.



## Contents

* [Braille time](#base-n-time)
* [Features](#features)
* [Fonts](#fonts)
* [Build, test, deploy](#build-test-deploy)

## Braille time

The Braille Time watch shows the time as HH:MM:SS using [Braille digits](https://en.wikipedia.org/wiki/Braille).
The digits 1-9 and 0 correspond to the letters A-J:

![Braille digits](resources/graphics/BrailleDigits-copy.png)

The watch face does not use an actual Braille font to show the digits, but rather draws them from scratch (with the `fillCircle` and `drawCircle` library functions).
The Braille digits scale appropriately to the watch screen resolution.

## Features

The Braille Time watch face supports the following features:

|Screenshot|Description|
|-|:-|
|![](resources/graphics/BrailleTimeHero1.png)|**Braille time**<br />Time displayed as Braille digits. Each digit is composed of six circles (dots), filled (when the dot is _raised_) and empty (when the dot is _flat_). There are two groups of two digits, one for the hour (in white color) and one for the minutes (in orange color).|
|![](resources/graphics/BrailleTimeHero2.png)|**Standard time**<br />Standard time can be toggled on and off by the user with a setting in the Customize menu on the device. Standard time is displayed in a small, light gray font beneath the Braille time.|


## Fonts

The Braille Time watch face uses custom fonts:

* [Ubuntu](https://fonts.google.com/specimen/Ubuntu) for the standard time (regular).

The development process was as follows:

* The fonts were downloaded from [Google Fonts](https://fonts.google.com/) as True Type  (`.ttf`) fonts.
* The fonts were converted to bitmaps as `.fnt` and `.png` pairs using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.
* The font sizes were established to match the Garmin Fenix 7X Solar watch 280x280 pixel screen resolution.
* The fonts were then scaled proportionally to match other screen sizes available on Garmin watches with round screens using the included [utility script](utils/generate_fonts.py).

The table below lists all font sizes provided for the supported screen resolutions.

| Resolution |    Shape     |    Element    |      Font      | Size |
| ---------: | :----------- | :------------ | :------------- | ---: |
|  148 x 205 | rectangle    | Standard time | Ubuntu regular |   16 |
|  176 x 176 | semi-octagon | Standard time | Ubuntu regular |   19 |
|  215 x 180 | semi-round   | Standard time | Ubuntu regular |   19 |
|  218 x 218 | round        | Standard time | Ubuntu regular |   23 |
|  240 x 240 | round        | Standard time | Ubuntu regular |   26 |
|  240 x 240 | rectangle    | Standard time | Ubuntu regular |   26 |
|  260 x 260 | round        | Standard time | Ubuntu regular |   28 |
|  280 x 280 | round        | Standard time | Ubuntu regular |   30 |
|  320 x 360 | rectangle    | Standard time | Ubuntu regular |   34 |
|  360 x 360 | round        | Standard time | Ubuntu regular |   39 |
|  390 x 390 | round        | Standard time | Ubuntu regular |   42 |
|  416 x 416 | round        | Standard time | Ubuntu regular |   45 |
|  454 x 454 | round        | Standard time | Ubuntu regular |   49 |


## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests -- note: requires the simulator to be running
make test

# run the simulation 
make run

# clean up the project directory
make clean
```

To sideload your application to your Garmin watch, see [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/).
