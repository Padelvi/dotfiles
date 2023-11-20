#!/usr/bin/python3

import os
import sys
import platform

"""
This script links every dir to where it should be and if in arch or artix linux tries to install needed packages.
The dir is expected to be /home/$USER/dotfiles
For now it should be in that dir, later I'll add an option to modify it if necessary.
Licensed under MIT, see LICENSE in the root dir of the repository for more details.
"""

def install(in_arch: bool):
    user = os.environ.get("USER") if os.environ.get("USER") else os.environ.get("USERNAME")
    if user == "root":
        if in_arch:
            with open("pkglist.txt", "rt") as f:
                pkgs = tuple(map(lambda s: s[:-1], f.readlines()))
            if input("Also install packages from AUR (y/n)? ") in ("y", "yes"):
                with open("aur.txt", "rt") as f:
                    aur = tuple(map(lambda s: s[:-1], f.readlines()))
                    print(aur)
            print(pkgs)
        else:
            print("Root is only for installing packages. If you do not use arch run as your user.")
            sys.exit(1)
    print(f"Running as {user}")

    args = sys.argv[1:]
    print(args)

    dir = {"README.md", "nvim", "gtk-3.0", "swaylock", "zsh", "sway", "kitty", "swaync", ".git", "completions", "install.py", "waybar", ".gitignore", "LICENSE", "aur.txt", "pkglist.txt"}
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
