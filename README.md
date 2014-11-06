Can’t wait for apps to be updated to support the dark theme of Yosemite?

![White Menu Icons](http://methylblue.com/junk/yosinvert.png)

## Installation

Run this script:

    curl https://raw.githubusercontent.com/mxcl/yosemite-menu-inverter/master/invert.rb | ruby

Here’s a Twitter friendly URL:

    curl -L http://bit.ly/yosinvert  | ruby

### Currently supports:

* 1Password
* BitTorrent Sync
* Crashlytics
* CrashPlan
* Degrees
* Dropbox (no need anymore, just update your app)
* F.lux
* GrabBox
* Google Drive
* Pomodoro Timer
* Radium
* TestFlight
* Window Magnet

## FAQ

* I'm getting `no decode delegate for this image format 'TIFF'` - what should I do?

    Reinstall imagemagick with libtiff: `brew reinstall imagemagick --with-libtiff`
