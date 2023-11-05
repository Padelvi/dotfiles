# Git remote commands
alias gra="git remote add origin"
alias grm="git remote remove origin"
alias gr="git remote show origin | grep URL"

# Other git commands
alias gcn="git config --global"
alias gi="git init"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push -u origin"
alias glo="git log"
alias gl="git pull origin"
alias gdf="git diff"

# Python
alias py="python3"
alias pys="python3 -m http.server"
alias pyv="python3 -m venv venv"
alias von="source ./venv/bin/activate"
alias voff="deactivate"

# Ls
alias l="eza -lga"
alias ll="eza -lg"

# Keyboard, I use cliphist with fzf
alias clp="cliphist list | fzf | cliphist decode | wl-copy"
alias cld="cliphist list | fzf | cliphist delete"
alias clw="cliphist wipe"

# Others
alias nv="nvim"
alias cls="clear"
alias t="touch"
alias ex="exit"
alias exp="export"
alias ino="arduino-cli"
alias ghr="gh repo"
alias rm="echo Do not use rm, use trash instead, you wanted to delete "
