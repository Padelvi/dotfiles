# Completions for arduino-cli
fpath=($HOME/.oh-my-zsh/arduino-cli $fpath)

# Battery prompt
RPROMPT='$(battery_pct_prompt)'

# Theme
ZSH_THEME="agnoster"

# Disable updates
zstyle ':omz:update' mode disabled

# Fzf zsh config via zstyle
zstyle ':fzf-tab:complete:cd:*' fzf-preview ''

# Default editors
export EDITOR=nvim
export GIT_EDITOR=nvim
export SUDO_EDITOR=vi

# Plugins
plugins=(sudo battery zsh-interactive-cd fzf-tab zsh-fzf-history-search zsh-syntax-highlighting zsh-you-should-use)

source /home/padelvi/.oh-my-zsh/oh-my-zsh.sh

# Add ~/.local/bin to PATH
if ! [[ "$PATH" =~ "/home/padelvi/.local/bin:" ]]
then
    PATH="/home/padelvi/.local/bin:$PATH"
fi
export PATH

# Aliases
source /home/padelvi/Templates/dotfiles/aliases.zsh
