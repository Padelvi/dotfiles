#!/usr/bin/python3

import os
import sys
from pathlib import Path
from typing import Callable

"""
This script links every dir to where it should be and if in arch or artix linux tries to install needed packages.
The dir is expected to be /home/$USER/dotfiles
For now it should be in that dir, later I'll add an option to modify it if necessary.
Licensed under MIT, see LICENSE in the root dir of the repository for more details.
"""

def link(src: str, dst: str):
    dst_path = Path(dst)
    if dst_path.exists():
        dst_path.rename(Path(str(dst) + ".bak"))
    os.symlink(src, dst)

def install_zsh(user: str):
    home = f"/home/{user}"
    src = f"{home}/dotfiles/zsh"
    link(f"{src}/zshrc", f"{home}/.zshrc")
    link(f"{src}/aliases.zsh", f"{home}/.oh-my-zsh/custom/aliases.zsh")

def install_nvim(user: str):
    home = f"/home/{user}"
    link(f"{home}/dotfiles/nvim", f"{home}/.config/nvim/lua/user")

def install_waybar(user: str):
    home = f"/home/{user}"
    src = f"{home}/dotfiles/waybar"
    dst = f"{home}/.config/waybar"
    dst_path = Path(dst)
    if not dst_path.exists():
        dst_path.mkdir()
    link(f"{src}/config.json", f"{dst}/config")
    link(f"{src}/style.css", f"{dst}/style.css")

def install_swaync(user: str):
    home = f"/home/{user}"
    src = f"{home}/dotfiles/swaync"
    dst = f"{home}/.config/swaync"
    dst_path = Path(dst)
    if not dst_path.exists():
        dst_path.mkdir()
    link(f"{src}/config.json", f"{dst}/config.json")
    link(f"{src}/style.css", f"{dst}/style.css")

def install():
    user = os.environ.get("USER") if os.environ.get("USER") else os.environ.get("USERNAME")
    if user == "root":
        print("It's not neccesary to run this as root.")
        sys.exit(1)
    elif user is not None:
        print(f"Running as {user}\n")

        dotfiles = Path(f"/home/{user}/dotfiles")
        config_home = Path(f"/home/{user}/.config")

        install_in_config_home = (
            "gtk-3.0",
            "swaylock",
            "sway",
            "kitty",
            "spotifyd",
        )

        install_special: dict[str, Callable[[str], None]] = {
            "zsh": install_zsh,
            "nvim": install_nvim,
            "waybar": install_waybar,
            "swaync": install_swaync,
        }

        unimportant = ("README.md", ".git", "install.py", ".gitignore", "LICENSE", "dinit")
        assert set(map(lambda p: p.parts[-1], dotfiles.iterdir())) == {*install_in_config_home, *install_special.keys(), *unimportant}

        print("Starting installation...")

        for config in install_in_config_home:
            print(f"Installing {config} configs...")
            link(f"{dotfiles}/{config}", f"{config_home}/{config}")

        for config in install_special.keys():
            print(f"Installing {config} configs...")
            install_special[config](user)
    else:
        print("Unknown user, define env variables USER or USERNAME")
        sys.exit(1)

if __name__ == "__main__":
    if sys.platform != "linux":
        print("Get linux!")
        sys.exit(1)
    install()
