## My system dotfiles

This is my repo for my dev dotfiles. Both for developing and as my daily driver, I use artix linux with dinit as my init system and swaywm as my WM.

The dotfiles, should not be limited to arch or artix, but I'll just ensure that they work with artix.

Also, as a dev, I code in python and a bit of lua, and I plan to start learning LaTeX for my math docs. My editor is neovim.

For now, I have added my configs for:

- Sway
- Swaylock
- Waybar
- SwayNC
- Kitty
- Spotifyd
- Zsh (I use oh-my-zsh)
- Neovim (using AstroNvim)
- Dinit scripts for some stuff

### Installation

I made an [install.py](https://github.com/Padelvi/dotfiles/blob/main/install.py) script (obviously no deps). I would have made an sh script but I know more about python scripting.

### Theme

For my first rice, I was trying the [nord](https://github.com/nordtheme/nord) theme. So thanks to them!

### License

I decided to license this repo (unlike the rest) under MIT so everyone can use this without any limitations. See more [here](https://github.com/Padelvi/dotfiles/blob/main/LICENSE).

### Thanks

My dotfiles borrow some code from these repos (thanks to their authors):

- [Base16-kitty](https://github.com/kdrag0n/base16-kitty) for the kitty nord theme config.
- [Base16-sway](https://github.com/rkubosz/base16-sway) for the sway nord theme config.
- [Vim-kitty-navigator plugin](https://github.com/knubie/vim-kitty-navigator) for the kitty/pass_keys.py and kitty/neighboring_window.py files.
- [This repo](https://github.com/cafecitohippo/nordicvectors) for the wallpapers (That is not code but whatever).
- [Dinit-userservd-services](https://github.com/Xynonners/dinit-userservd-services) for some of the dinit scripts and the shell script dbus-session.
