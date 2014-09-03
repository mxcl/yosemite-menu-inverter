if File.directory? "/Applications/Dropbox.app"
  %w{busy-lep busy2-lep busy3-lep busy4-lep
     idle-lep
     pause-lep x-lep
     logo-lep}.each do |img|
    img = "/Applications/Dropbox.app/Contents/Resources/dropboxstatus-#{img}.tiff"
    system "convert -negate #{img} #{img}"

    if not $?.success?
      abort "    try: brew install imagemagick --with-libtiff"
    end
  end
end

system %{killall Dropbox && open /Applications/Dropbox.app}


# 1Password

# App Store version requires sudo, please submit code to detect if sudo is
# needed
## img = "/Applications/1Password.app/Contents/Library/LoginItems/2BUA8C4S2C.com.agilebits.onepassword-osx-helper.app/Contents/Resources/menubar-icon.tiff"
## system "sudo convert -negate #{img} #{img}"
