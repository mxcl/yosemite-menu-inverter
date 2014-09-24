def sudo_needed?(filename)
  `ls -l #{filename} | awk '{ print $3 }'`.strip == "root"
end

def sudo(command)
  system "sudo #{command}"
end

def relaunch(app)
  system %{killall "#{app}" && open "/Applications/#{app}.app"}
end

# Pomodoro Timer
if File.directory? "/Applications/Pomodoro Timer.app"
  %w{ menu_bar_icon_break menu_bar_icon_break@2x menu_bar_icon_normal_black menu_bar_icon_normal_black@2x }.each do |suffix|
    prefix = "/Applications/Pomodoro Timer.app/Contents/Resources/"
    img = "#{prefix}#{suffix}.png"
    sudo %{convert -negate "#{img}" "#{img}"}

    if not $?.success?
      abort "    try: brew install imagemagick --with-libtiff"
    end
  end
  relaunch "Pomodoro Timer"
end

# Dropbox
if File.directory? "/Applications/Dropbox.app"
  %w{busy-lep busy2-lep busy3-lep busy4-lep
     idle-lep
     pause-lep x-lep
     logo-lep}.each do |suffix|
    prefix = "/Applications/Dropbox.app/Contents/Resources/dropboxstatus"
    img = "#{prefix}-#{suffix}.tiff"
    system "convert -negate #{img} #{img}"

    if not $?.success?
      abort "    try: brew install imagemagick --with-libtiff"
    end

    inv = "#{prefix}-#{suffix}-inv.tiff"
    system "convert -negate #{inv} #{inv}"
  end
end
relaunch "Dropbox"

# Window Magnet
if File.directory? "/Applications/Window Magnet.app"
  base_path = "/Applications/Window\\ Magnet.app/Contents/Resources/"
  origin_dark = base_path + "StatusIcon.tiff"
  origin_light = base_path + "StatusIconClicked.tiff"
  tmp = base_path << "StatusIcon.tmp"

  sudo "mv #{origin_dark} #{tmp}"
  sudo "mv #{origin_light} #{origin_dark}"
  sudo "mv #{tmp} #{origin_light}"
  relaunch "Window\\ Magnet"
end

# BitTorrent Sync
if File.directory? "/Applications/BitTorrent Sync.app"
  `ls /Applications/BitTorrent\\ Sync.app/Contents/Resources/trayIcon_*`.split("\n").each do |filename|
    `convert -negate "#{filename}" "#{filename}"`
  end
  relaunch "BitTorrent\\ Sync"
end

# Degrees
if File.directory? "/Applications/Degrees.app"
  base_path = "/Applications/Degrees.app/Contents/Resources/"
  %w{cloud_highlighted cloud_moon_highlighted cloud_moon cloud_sun_highlighted
    cloud_sun cloud clouds_highlighted clouds fog_highlighted
    moon_cloud_highlighted moon_cloud moon_highlighted moon rain_highlighted
    rain showers_highlighted showers snowflake_highlighted snowflake
    sun_highlighted sun thunder_highlighted thunder}.each do |filename|
    non_retina = base_path + filename + ".png"
    retina = base_path + filename + "@2x.png"
    sudo %{convert -negate "#{non_retina}" "#{non_retina}"}
    sudo %{convert -negate "#{retina}" "#{retina}"}
  end
  relaunch "Degrees"
end

# Radium
if File.directory? "/Applications/Radium.app"
  base_path = "/Applications/Radium.app/Contents/Resources/"
  %w{menubar_icon_busy_1 menubar_icon_busy_2 menubar_icon_busy_3
    menubar_icon_busy_4 menubar_icon_busy_5 menubar_icon_busy_6
    menubar_icon_disabled menubar_icon_pressed menubar_icon_regular
    menubar_icon_success}.each do |filename|
    full_filename = base_path + filename + ".tiff"
    `convert -negate "#{full_filename}" "#{full_filename}"`
  end
  relaunch "Radium"
end


# 1Password
if File.directory? "/Applications/1Password.app"
  ## root = "/Applications/1Password.app/Contents/Library/LoginItems/2BUA8C4S2C.com.agilebits.onepassword-osx-helper.app/Contents/Resources"
  ## img = "#{root}/menubar-icon.tiff"
  ## inv = "#{root}/menubar-selected-graphite.tiff"
  ## TODO copy graphite one over the default one as it looks correct
  ## system "sudo convert -negate #{img} #{img}"
end
