#!/bin/sh 

echo 📌 Configuring macOS default settings

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
# sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable the sound effects on boot
# sudo nvram SystemAudioVolume=" "

###########################################################
# General Settings
###########################################################
defaults write "Apple Global Domain" AppleInterfaceStyle -string Dark
# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# defaults write com.apple.universalaccess reduceMotion -bool true

###########################################################
# Keyboard
###########################################################
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

###########################################################
# Trackpad, Mouse
###########################################################
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0
defaults write -g com.apple.trackpad.scaling -float 2.5

defaults write -g com.apple.mouse.scaling -float 2.5
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton

###########################################################
# Language
###########################################################
# Show language menu in the top right corner of the boot screen
# sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

###########################################################
# Dock
###########################################################
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock orientation -string right
defaults write com.apple.dock tilesize -float 24

###########################################################
# Menu Bar
###########################################################
# defaults write NSGlobalDomain _HIHideMenuBar -bool true

###########################################################
# Spaces
###########################################################
defaults write com.apple.Accessibility ReduceMotionEnabled -bool true

###########################################################
# Finder
###########################################################
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder AppleShowAllFiles YES
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Show the ~/Library folder
# chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Show the /Volumes folder
# sudo chflags nohidden /Volumes

###########################################################
# Screenshot
###########################################################
# Save screenshots to ~/screenshots
defaults write com.apple.screencapture location -string "${HOME}/screenshots"

