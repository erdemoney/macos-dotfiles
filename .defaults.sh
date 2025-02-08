#!/bin/sh

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0.1

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.2

# Disable trash sound
defaults write com.apple.Finder FinderSounds -bool false

# Enable resume for safari
defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool true

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Show battery percentage
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

killall Dock
killall Finder
