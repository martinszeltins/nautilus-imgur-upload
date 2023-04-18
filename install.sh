#!/bin/bash

# Define variables
SCRIPT_NAME="Upload to Imgur"
SRC_DIR="$(pwd)"
DST_DIR="$HOME/.local/share/nautilus/scripts"
ICON_NAME="imgur.png"
ICON_SRC="$SRC_DIR/$ICON_NAME"
ICON_DST="$HOME/.local/share/icons/hicolor/128x128/apps"

# Install xclip if it's not already installed
if ! command -v xclip &> /dev/null
then
    echo "Installing xclip... \n"
    sudo apt install xclip -y
fi

# Install curl if it's not already installed
if ! command -v curl &> /dev/null
then
    echo "Installing curl... \n"
    sudo apt install curl -y
fi

# Create the destination directories if they don't exist
mkdir -p "$DST_DIR"
mkdir -p "$ICON_DST"

# Copy the "Upload to Imgur" script to the destination directory
cp "$SRC_DIR/$SCRIPT_NAME" "$DST_DIR/$SCRIPT_NAME"

# Make the script executable
chmod +x "$DST_DIR/$SCRIPT_NAME"

# Copy the icon to the destination directory
cp "$ICON_SRC" "$ICON_DST/$ICON_NAME"

# Set the icon for the "Upload to Imgur" script
gio set -t string "$DST_DIR/$SCRIPT_NAME" "metadata::custom-icon" "file://$ICON_DST/$ICON_NAME"

echo "Installation complete. Now you can right-click on an image in Nautilus and select Scripts -> Upload to Imgur."

# Open the destination directory in Nautilus
nautilus "$DST_DIR" &
