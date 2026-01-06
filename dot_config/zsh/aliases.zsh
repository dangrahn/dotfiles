# ~/.config/zsh/aliases.zsh - Shell aliases

# ===== General =====

alias reload!='source ~/.config/zsh/.zshrc'
alias cls='clear'

# ===== Navigation =====

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias code='cd ~/code'
alias dotfiles='cd ~/code/dangrahn/dotfiles'

# ===== Safety =====

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ===== ls =====

alias ls='ls --color=auto -F'
alias l='ls -lAh'
alias ll='ls -l'
alias la='ls -A'

# ===== Git =====

alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gp='git push origin HEAD'
alias gl='git pull --prune'
alias gd='git diff'
alias gds='git diff --staged'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gac='git add -A && git commit -m'

# Git + GitHub CLI
alias gpr='gh pr create'
alias gprs='gh pr status'
alias gprv='gh pr view'

# ===== Docker =====

alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dlog='docker logs -f'
alias dex='docker exec -it'

# ===== Homebrew =====

alias brewup='brew update && brew upgrade && brew cleanup'

# ===== Zellij =====

alias zj='zellij'
alias zja='zellij attach'
alias zjl='zellij list-sessions'
