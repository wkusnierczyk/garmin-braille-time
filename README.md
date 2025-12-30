# Garmin Braille Time

A minimalist, elegant, typography-focused Garmin Connect IQ watch face that displays the current time using Braille digits.

![Braille](resources/graphics/BrailleTimeHero1.png)
![Braille plus standard](resources/graphics/BrailleTimeHero2.png)

Available from the [Garmin Connect IQ Developer portal](https://apps.garmin.com/apps/b9312f59-3767-4f2d-8da3-475135ce17dd).

## Contents

* [Braille time](#base-n-time)
* [Fonts](#fonts)
* [Build, test, deploy](#build-test-deploy)

## Braille time

The Braille Time watch shows the time as HH:MM:SS using [Braille digits](https://en.wikipedia.org/wiki/Braille).
The digits 1-9 and 0 correspond to the letters A-J:

![Braille digits](resources/graphics/BrailleDigits-copy.png)

The watch face does not use an actual Braille font to show the digits, but rather draws them from scratch (with the `fillCircle` and `drawCircle` library functions).
The Braille digits scale appropriately to the watch screen resolution.

### User settings

The watch face supports the following user settings, available as an on-watch customize menu:

* Standard time display can be toggled on/off.

## Fonts

The Braille Time watch face uses custom fonts:

* [Ubuntu](https://fonts.google.com/specimen/SUSE+Mono) for standard time (Ubuntu-Regular).

The development process was as follows:

* The fonts were downloaded from [Google Fonts](https://fonts.google.com/) as True Type  (`.ttf`) fonts.
* The fonts were converted to bitmaps as `.fnt` and `.png` pairs using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.
* The font sizes were established to match the Garmin Fenix 7X Solar watch 280x280 pixel screen resolution.
* The fonts were then scaled proportionally to match other screen sizes available on Garmin watches with round screens using the included [utility script](utils/generate_fonts.py).

The table below lists all font sizes provided for the supported screen resolutions.

| Resolution | Element       | Font           | Size |
| ---------: | :------------ | :------------- | ---: |
|  218 x 218 | Standard time | Ubuntu regular |   23 |
|  240 x 240 | Standard time | Ubuntu regular |   26 |
|  260 x 260 | Standard time | Ubuntu regular |   28 |
|  280 x 280 | Standard time | Ubuntu regular |   30 |
|  360 x 360 | Standard time | Ubuntu regular |   39 |
|  390 x 390 | Standard time | Ubuntu regular |   42 |
|  416 x 416 | Standard time | Ubuntu regular |   45 |
|  454 x 454 | Standard time | Ubuntu regular |   49 |


## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests (none implemented at this time)
make test

# run the simulation
make run
```

To sideload your application to your Garmin watch, see [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/).
