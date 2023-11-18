#!/usr/bin/python

import os
import sys
import platform

def install(in_arch: bool):
    user = os.environ.get("USER") if os.environ.get("USER") else os.environ.get("USERNAME")
    if user == "root" and not in_arch:
        print("Root is only for installing packages. If you do not use arch run as your user.")
        sys.exit(1)
    print(f"Running as {user}")

    args = sys.argv[1:]
    print(args)

    dir = {"README.md", "nvim", "gtk-3.0", "swaylock", "zsh", "sway", "kitty", "swaync", ".git", "completions", "install.py", "waybar", ".gitignore", "LICENSE"}
    assert set(os.listdir()) == dir 
    unimportant = ("README.md", ".git", "install.py", ".gitignore", "LICENSE")
    for f in unimportant:
        dir.remove(f)

    print("Installing...")

if __name__ == "__main__":
    in_arch = True
    if sys.platform != "linux":
        print("Get arch or artix linux!")
        sys.exit(1)
    else:
        p = platform.freedesktop_os_release()["ID"]
        if p not in ("arch", "artix"):
            print("Get arch or artix!")
            print("You will not be able to install packages.")
            if input("Install anyway (y/n)? ") not in ("yes", "y"):
                sys.exit(1)
            in_arch = False
    install(in_arch)
