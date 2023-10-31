#!/bin/sh

# Config path, exit if it does not exist
config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
if [ ! -f "$config" ]; then exit 1; fi

# Set schema
gnome_schema="org.gnome.desktop.interface"

# Set GTK global theme
# gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# gsettings set "$gnome_schema" gtk-theme "$gtk_theme"

# Set GTK icon theme
icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
gsettings set "$gnome_schema" icon-theme "$icon_theme"

# Set GTK cursor theme
cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
gsettings set "$gnome_schema" cursor-theme "$cursor_theme"

# Set GTK main font
# font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"
# gsettings set "$gnome_schema" font-name "$font_name"
