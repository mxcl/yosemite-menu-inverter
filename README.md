Can’t wait for apps to be updated to support the dark theme of Yosemite?

![White Menu Icons](http://methylblue.com/junk/yosinvert.png)

## Installation

Run this script:

    curl https://raw.githubusercontent.com/mxcl/yosemite-menu-inverter/master/invert.rb | ruby

Here’s a Twitter friendly URL:

    curl -L http://bit.ly/yosinvert  | ruby

### Currently supports:

* BitTorrent Sync
* Caffeine
* Crashlytics
* CrashPlan
* Degrees
* GrabBox
* Google Drive
* Google Hangouts Extension
* Pomodoro Timer
* Radium
* TestFlight
* TVShows App
* Window Magnet

## FAQ

* I'm getting `no decode delegate for this image format 'TIFF'` - what should I do?

    Reinstall imagemagick with libtiff: `brew reinstall imagemagick --with-libtiff`
