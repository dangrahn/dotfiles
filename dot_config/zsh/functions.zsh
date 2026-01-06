# ~/.config/zsh/functions.zsh - Shell functions

# ===== Navigation =====

# c - Quick cd to projects directory
# Usage: c <tab>  -> autocomplete project directories
function c() {
    cd "${PROJECTS:-$HOME/code}/$1"
}

# Completion for c function
function _c() {
    _files -W "${PROJECTS:-$HOME/code}" -/
}
compdef _c c

# mkcd - Make directory and cd into it
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ===== Extraction =====

# extract - Universal archive extractor
function extract() {
    if [[ ! -f "$1" ]]; then
        echo "'$1' is not a valid file"
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar -jxvf "$1"        ;;
        *.tar.gz)    tar -zxvf "$1"        ;;
        *.tar.xz)    tar -Jxvf "$1"        ;;
        *.tar.zst)   tar --zstd -xvf "$1"  ;;
        *.bz2)       bunzip2 "$1"          ;;
        *.gz)        gunzip "$1"           ;;
        *.tar)       tar -xvf "$1"         ;;
        *.tbz2)      tar -jxvf "$1"        ;;
        *.tgz)       tar -zxvf "$1"        ;;
        *.zip)       unzip "$1"            ;;
        *.ZIP)       unzip "$1"            ;;
        *.Z)         uncompress "$1"       ;;
        *.7z)        7z x "$1"             ;;
        *.rar)       unrar x "$1"          ;;
        *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
}

# ===== Editor =====

# e - Open editor (respects $EDITOR)
function e() {
    ${EDITOR:-vim} "${1:-.}"
}

# ===== Git Helpers =====

# Clean up merged branches
function git-branch-clean() {
    git branch --merged | grep -v "\*\|main\|master" | xargs -n 1 git branch -d
}

# Create a new branch and push it
function gcb() {
    git checkout -b "$1" && git push -u origin "$1"
}
