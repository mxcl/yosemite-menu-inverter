##
# Helpers
##
def sudo_needed?(filename)
  `ls -l #{filename} | awk '{ print $3 }'`.strip == "root"
end

def sudo(command)
  system "sudo #{command}"
end

def relaunch(app)
  system %{killall "#{app}" && open "/Applications/#{app}.app"}
end

##
# Apps icon overwrite
##

# 1Password
if File.directory? "/Applications/1Password.app"
  root = "/Applications/1Password.app/Contents/Library/LoginItems/2BUA8C4S2C.com.agilebits.onepassword-osx-helper.app/Contents/Resources"
  img = "#{root}/menubar-icon.tiff"
  ## inv = "#{root}/menubar-selected-graphite.tiff"
  system *%W{sudo convert -negate #{img} #{img}}
  system "killall", "2BUA8C4S2C.com.agilebits.onepassword-osx-helper"
end

# BitTorrent Sync
if File.directory? "/Applications/BitTorrent Sync.app"
  `ls /Applications/BitTorrent\\ Sync.app/Contents/Resources/trayIcon_*`.split("\n").each do |filename|
    system %{convert -negate "#{filename}" "#{filename}"}
  end
  relaunch "BitTorrent\\ Sync"
end

# Crashlytics
if File.directory? "/Applications/Crashlytics.app"
  %w{image.status-item}.each do |suffix|
    prefix = "/Applications/Crashlytics.app/Contents/Resources/"
    img = "#{prefix}#{suffix}.tiff"
    system "convert -negate #{img} #{img}"
  end

  relaunch "Crashlytics"
end

# CrashPlan
if File.directory? "/Applications/CrashPlan.app/Contents/Resources/CrashPlan menu bar.app"
  %w{cp_status_active_anim_dots1 cp_status_active_anim_dots2 cp_status_active_anim_dots3 cp_status_active_anim_dots4 cp_status_active_anim_dots5 cp_status_active_anim_dots6 cp_status_active_anim_dots7 cp_status_active_anim_dots8 cp_status_active_anim_dots9 cp_status_active_anim_dots10 cp_status_active_anim_dots11 cp_status_active_anim_dots12 cp_status_active_anim_dots13 cp_status_active_anim_dots14 cp_status_active_anim_dots15 cp_status_active_anim_dots16 cp_status_active_anim_dots17 cp_status_active_anim_dots18 cp_status_active_anim_dots19 cp_status_active_anim_dots20 cp_status_active_anim_dots21 cp_status_alert_dots dots_cp_status_active_anim0 dots_cp_status_active_anim1 dots_cp_status_active_anim2 dots_cp_status_active_anim3 dots_cp_status_active_anim4 dots_cp_status_active_anim5 dots_cp_status_active_anim6 dots_cp_status_active_anim7 dots_cp_status_active_anim8 dots_cp_status_active_anim9 dots_cp_status_active_anim10 dots_cp_status_active_anim11 dots_cp_status_active_anim12 dots_cp_status_active_anim13 dots_cp_status_active_anim14 dots_cp_status_active_anim15 dots_cp_status_active_anim16 dots_cp_status_active_anim17 dots_cp_status_active_anim18 dots_cp_status_active_anim19 dots_cp_status_active_anim20 dots_cp_status_active_anim21 dots_cp_status_complete_alert dots_cp_status_complete dots_cp_status_gray dots_cp_status_paused dots_cp_status_safe_alert dots_cp_status_safe dots_cp_status_severe_alert dots_cp_status_severe dots_cp_status_warning_alert dots_cp_status_warning gradient_cp_status_active_anim0 gradient_cp_status_active_anim1 gradient_cp_status_active_anim2 gradient_cp_status_active_anim3 gradient_cp_status_active_anim4 gradient_cp_status_active_anim5 gradient_cp_status_active_anim6 gradient_cp_status_active_anim7 gradient_cp_status_active_anim8 gradient_cp_status_active_anim9 gradient_cp_status_active_anim10 gradient_cp_status_active_anim11 gradient_cp_status_active_anim12 gradient_cp_status_active_anim13 gradient_cp_status_active_anim14 gradient_cp_status_active_anim15 gradient_cp_status_active_anim16 gradient_cp_status_active_anim17 gradient_cp_status_active_anim18 gradient_cp_status_active_anim19 gradient_cp_status_active_anim20 gradient_cp_status_active_anim21 gradient_cp_status_active_anim22 gradient_cp_status_active_anim23 gradient_cp_status_active_anim24 gradient_cp_status_active_anim25 gradient_cp_status_active_anim26 gradient_cp_status_complete_alert gradient_cp_status_complete gradient_cp_status_gray gradient_cp_status_paused gradient_cp_status_safe_alert gradient_cp_status_safe gradient_cp_status_severe_alert gradient_cp_status_severe gradient_cp_status_warning_alert gradient_cp_status_warning no_animation_cp_status_active_anim0 no_animation_cp_status_complete_alert no_animation_cp_status_complete no_animation_cp_status_paused no_animation_cp_status_safe_alert no_animation_cp_status_safe no_animation_cp_status_severe_alert no_animation_cp_status_severe no_animation_cp_status_warning_alert no_animation_cp_status_warning}.each do |suffix|
    prefix = "/Applications/CrashPlan.app/Contents/Resources/CrashPlan menu bar.app/Contents/Resources/"
    img = "#{prefix}#{suffix}.png"
    system "convert -negate \"#{img}\" \"#{img}\""

    if not $?.success?
      abort "    try: brew install imagemagick --with-libtiff"
    end
  end
  system %{killall "CrashPlan menu bar" && open "/Applications/CrashPlan.app/Contents/Resources/CrashPlan menu bar.app"}
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

# GrabBox
if File.directory? "/Applications/GrabBox.app"
  %w{menuicon-animation-1 menuicon-animation-2 menuicon-animation-3 menuicon-animation-4 menuicon-animation-5 menuicon-animation-6 menuicon-animation-7 menuicon-animation-8 menuicon}.each do |suffix|
    prefix = "/Applications/GrabBox.app/Contents/Resources/"
    img = "#{prefix}#{suffix}.tiff"
    system "convert -negate #{img} #{img}"

    if not $?.success?
      abort "    try: brew install imagemagick --with-libtiff"
    end
  end
  relaunch "GrabBox"
end

# Google Drive
if File.directory? "/Applications/Google Drive.app"
  Dir["/Applications/Google Drive.app/Contents/Resources/mac-*.png"].each do |img|
    system %{convert -negate "#{img}" "#{img}"}
  end
  relaunch "Google Drive"
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

# Radium
if File.directory? "/Applications/Radium.app"
  base_path = "/Applications/Radium.app/Contents/Resources/"
  %w{menubar_icon_busy_1 menubar_icon_busy_2 menubar_icon_busy_3
    menubar_icon_busy_4 menubar_icon_busy_5 menubar_icon_busy_6
    menubar_icon_disabled menubar_icon_pressed menubar_icon_regular
    menubar_icon_success}.each do |filename|
    full_filename = base_path + filename + ".tiff"
    system *%W{convert -negate #{full_filename} #{full_filename}}
  end
  relaunch "Radium"
end

# Testflight
if File.directory? "/Applications/TestFlight.app"
  %w{tf-menubar-icon}.each do |suffix|
    prefix = "/Applications/TestFlight.app/Contents/MacOS/TestFlightHelper.app/Contents/Resources/"
    img = "#{prefix}#{suffix}.png"
    sudo %{convert -negate "#{img}" "#{img}"}

    abort "    try: brew install imagemagick --with-libtiff" if not $?.success?
  end

  system %{killall TestFlightHelper && open /Applications/TestFlight.app}
end

# Tomighty
if File.directory? "/Applications/Tomighty.app"
  %w{tf-menubar-icon}.each do |suffix|
    prefix = "/Applications/Tomighty.app/Contents/Resources"
    img = "#{prefix}/status-normal.tiff"
    sudo %{convert -negate "#{img}" "#{img}"}

    abort "    try: brew install imagemagick --with-libtiff" if not $?.success?
  end

  system %{killall Tomighty && open /Applications/Tomighty.app}
end

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

# Google Hangouts
base_hangouts_dir = "#{`echo $HOME`.strip}/Library/Application\\ Support/Google/Chrome/Default/Extensions/nckgahadagoaajjgafhacjanaoiihapd/"
if File.directory? base_hangouts_dir
  current_hangouts_version = `ls #{base_hangouts_dir} | tail -1`.strip

  prefix = "#{base_hangouts_dir}#{current_hangouts_version}/images_4/presence/"
  `ls #{prefix} | grep "mac"`.split("\n").each do |filename|
    img = "#{prefix}#{filename}"
    system %{convert -negate #{img} #{img}}
  end
  relaunch "Google\ Chrome"
end
