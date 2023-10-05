# Completions for arduino-cli and eza
fpath=($HOME/Others/completions $fpath)

# Battery prompt
RPROMPT='$(battery_pct_prompt)'

# Theme
ZSH_THEME="fino"

# Disable updates
zstyle ':omz:update' mode disabled

# Fzf zsh config via zstyle
zstyle ':fzf-tab:complete:cd:*' fzf-preview ''

# Env vars
export EDITOR=nvim
export GIT_EDITOR=nvim
export SUDO_EDITOR=nano
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

# Plugins
plugins=(sudo battery zsh-interactive-cd fzf-tab zsh-fzf-history-search zsh-syntax-highlighting zsh-you-should-use zoxide zsh-abbr)

source /home/padelvi/.oh-my-zsh/oh-my-zsh.sh

# Add ~/.local/bin to PATH
if ! [[ "$PATH" =~ "/home/padelvi/.local/bin:" ]]
then
    PATH="/home/padelvi/.local/bin:$PATH"
fi
export PATH

# Reload completions
compinit

# Zoxide
eval "$(zoxide init zsh)"

# Thefuck
eval $(thefuck --alias)
