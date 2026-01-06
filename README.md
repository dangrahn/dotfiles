# dotfiles

Modern dotfiles managed with [chezmoi](https://chezmoi.io/).

## Features

- **chezmoi** - Dotfile manager with templating
- **Antidote** - Lightweight zsh plugin manager
- **starship** - Modern cross-shell prompt
- **zellij** - Terminal multiplexer
- **git-delta** - Better git diffs
- **fnm** - Fast Node Manager
- **direnv** - Per-directory environment

## Installation

### Step 1: Install System Dependencies

```bash
sudo apt update && sudo apt install -y build-essential procps curl file git zsh
```

### Step 2: Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Step 3: Add Homebrew to Current Session

```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### Step 4: Install chezmoi

```bash
brew install chezmoi
```

### Step 5: Initialize and Apply Dotfiles

This will prompt for your name and email, then install all Homebrew packages from the Brewfile.

```bash
# From local directory
chezmoi init --source=/home/daniel/code/dangrahn/dotfiles --apply

# Or from GitHub (after pushing)
chezmoi init git@github.com:dangrahn/dotfiles.git --apply
```

### Step 6: Change Default Shell to zsh

```bash
chsh -s $(which zsh)
```

### Step 7: Log Out and Back In

Log out of your session and log back in for the shell change to take effect.

### Step 8: Install Node.js and Dev Tools

After logging back in with zsh as your default shell:

```bash
fnm install 23
fnm default 23
npm install -g @anthropic-ai/claude-code opencode
```

## Structure

```
.
├── .chezmoi.toml.tmpl      # chezmoi config (prompts for user data)
├── .chezmoiexternal.toml   # External deps (Antidote)
├── .chezmoiignore          # Files to skip
├── Brewfile                # Homebrew packages
├── dot_zshenv              # Bootstrap (sets ZDOTDIR)
├── dot_config/
│   ├── zsh/
│   │   ├── dot_zshenv      # Environment variables
│   │   ├── dot_zshrc       # Interactive shell config
│   │   ├── aliases.zsh     # Aliases
│   │   ├── functions.zsh   # Functions (c, extract, mkcd, e)
│   │   └── plugins.txt     # Antidote plugins
│   ├── git/
│   │   ├── config.tmpl     # Git config (templated)
│   │   └── ignore          # Global gitignore
│   └── starship.toml       # Prompt config
└── run_once_before_*.sh    # Setup script
```

## Daily Usage

```bash
# Edit source and apply
vim ~/code/dangrahn/dotfiles/dot_config/zsh/aliases.zsh
chezmoi apply

# Or edit applied file and re-add
vim ~/.config/zsh/aliases.zsh
chezmoi re-add

# Commit changes
cd ~/code/dangrahn/dotfiles
git add -A && git commit -m "Update aliases"
git push
```

## Key Aliases

| Alias | Command |
|-------|---------|
| `gs` | `git status -sb` |
| `gp` | `git push origin HEAD` |
| `gl` | `git pull --prune` |
| `glog` | Pretty git log |
| `dc` | `docker compose` |
| `zj` | `zellij` |
| `c <dir>` | cd to ~/code/<dir> |
| `reload!` | Reload zsh config |

## Key Functions

| Function | Description |
|----------|-------------|
| `c <tab>` | Quick cd to projects |
| `extract <file>` | Extract any archive |
| `mkcd <dir>` | mkdir && cd |
| `e [file]` | Open $EDITOR |
