# Garmin Braille Time

A minimalist, elegant, typography-focused Garmin Connect IQ watch face that displays the current time using Braille digits.

![Braille](resources/graphics/braille.png)
![Braille plus standard](resources/graphics/braille-standard.png)

Available from the [Garmin Connect IQ Developer portal](https://apps.garmin.com/apps/b9312f59-3767-4f2d-8da3-475135ce17dd).

## Contents

* [Braille time](#base-n-time)
* [Project structure](#project-structure)
* [Build, test, deploy](#build-test-deploy)

## Braille time

The Braille Time watch shows the time as HH:MM:SS using [Braille digits](https://en.wikipedia.org/wiki/Braille).
The digits 1-9 and 0 correspond to the letters A-J:

![Braille digits](resources/graphics/BrailleDigits-copy.png)

The watch face does not use an actual Braille font to show the digits, but rather draws them from scratch (with the `fillCircle` and `drawCircle` library functions).

The watch face uses a custom font for the standard time, [Ubuntu](https://fonts.google.com/specimen/Ubuntu), available from [Google Fonts](https://fonts.google.com/) as a True Type font (`ttf`).
It has been converted to a bitmap font (`bmp`, `fnt`) using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.

Standard time can be toggled on/off with an on-watch user setting.

## Project structure

```bash
BrailleTime
├── LICENSE
├── Makefile
├── manifest.xml
├── monkey.jungle
├── README.md
├── resources
│   ├── drawables
│   │   ├── drawables.xml
│   │   ├── launcher_icon.png
│   │   └── launcher_icon.svg
│   ├── fonts
│   │   ├── fonts.xml
│   │   ├── Ubuntu-Regular-30.fnt
│   │   └── Ubuntu-Regular-30.png
│   ├── graphics
│   │   └── *.png
│   ├── layouts
│   │   └── layout.xml
│   ├── settings
│   │   ├── properties.xml
│   │   └── settings.xml
│   └── strings
│       ├── digits.xml
│       ├── geometry.xml
│       └── strings.xml
└── source
    ├── BrailleTime.mc
    ├── BrailleTimeApp.mc
    ├── BrailleTimeConstants.mc
    ├── BrailleTimeSettings.mc
    ├── BrailleTimeTests.mc
    ├── BrailleTimeView.mc
    └── PropertyUtils.mc
```

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
