#!/usr/bin/env zsh
# macos-defaults.sh - macOS system preferences via `defaults` command
# Safe to run multiple times. Some changes require logout/restart.

set -euo pipefail

echo "Applying macOS defaults..."

# ============================================================
# Dock
# ============================================================
defaults write com.apple.dock autohide              -bool true
defaults write com.apple.dock autohide-delay        -float 0.1
defaults write com.apple.dock tilesize              -int 48
defaults write com.apple.dock show-recents          -bool false
defaults write com.apple.dock minimize-to-application -bool true

# ============================================================
# Finder
# ============================================================
defaults write com.apple.finder ShowPathbar                  -bool true
defaults write com.apple.finder ShowStatusBar                -bool true
defaults write com.apple.finder FXPreferredViewStyle         -string "Nlsv"   # List view
defaults write com.apple.finder FXDefaultSearchScope         -string "SCcf"   # Search current folder
defaults write com.apple.finder _FXShowPosixPathInTitle      -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder AppleShowAllFiles            -bool true        # Show hidden files
defaults write NSGlobalDomain  AppleShowAllExtensions        -bool true

# ============================================================
# Screenshots
# ============================================================
defaults write com.apple.screencapture type          -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# ============================================================
# Keyboard
# ============================================================
defaults write NSGlobalDomain KeyRepeat              -int 2
defaults write NSGlobalDomain InitialKeyRepeat       -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false  # Enable key repeat (not accent popup)

# Smart punctuation off (great for writing code)
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled  -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# ============================================================
# Trackpad
# ============================================================
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true  # Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# ============================================================
# TextEdit
# ============================================================
defaults write com.apple.TextEdit RichText    -int 0  # Plain text by default
defaults write com.apple.TextEdit TabWidth    -int 4

# ============================================================
# Time Machine
# ============================================================
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# ============================================================
# Activity Monitor
# ============================================================
defaults write com.apple.ActivityMonitor ShowCategory -int 0  # All processes

# ============================================================
# Security
# ============================================================
defaults write com.apple.screensaver askForPassword      -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ============================================================
# Restart affected services
# ============================================================
for app in Finder Dock SystemUIServer; do
    killall "$app" &>/dev/null || true
done

echo "macOS defaults applied. Log out and back in for full effect."
