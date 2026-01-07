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
- **opencode** - AI coding agent
- **claude-code** - Anthropic's Claude CLI

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

#### Option A: Symlink to Default Location (Recommended for Development)

This allows you to keep your dotfiles in `~/code/dangrahn/dotfiles` while using the standard `chezmoi apply` command without the `--source` flag.

```bash
# Clone or ensure dotfiles are at ~/code/dangrahn/dotfiles
mkdir -p ~/code/dangrahn
cd ~/code/dangrahn
git clone git@github.com:dangrahn/dotfiles.git

# Symlink to chezmoi's default source location
mkdir -p ~/.local/share
ln -sf ~/code/dangrahn/dotfiles ~/.local/share/chezmoi

# Initialize and apply (no --source flag needed)
chezmoi init --apply
```

#### Option B: Use Custom Source Directory

```bash
# From local directory (Linux)
chezmoi init --source=/home/daniel/code/dangrahn/dotfiles --apply

# From local directory (macOS)
chezmoi init --source=/Users/daniel/code/dangrahn/dotfiles --apply
```

#### Option C: Clone from GitHub

```bash
# Recommended for fresh installs - chezmoi clones to its default location
chezmoi init git@github.com:dangrahn/dotfiles.git --apply
```

**Note:** With Option A (symlink), you can edit files in `~/code/dangrahn/dotfiles` and run `chezmoi apply` without any flags. With Option B, you must specify `--source` every time you run chezmoi commands.

### Step 6: Change Default Shell to zsh

```bash
chsh -s $(which zsh)
```

### Step 7: Log Out and Back In

Log out of your session and log back in for the shell change to take effect.

Node.js 23, opencode, and claude-code are installed automatically during chezmoi apply.

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
├── run_once_before_*.sh    # Package installation
└── run_once_after_*.sh     # Node.js & npm setup
```

## Daily Usage

### With Symlink Setup (Option A - Recommended)

```bash
# Edit source files directly
vim ~/code/dangrahn/dotfiles/dot_config/zsh/aliases.zsh

# Apply changes
chezmoi apply

# Commit and push
cd ~/code/dangrahn/dotfiles
git add -A && git commit -m "Update aliases"
git push
```

### With Custom Source Directory (Option B)

```bash
# Edit source files directly
vim ~/code/dangrahn/dotfiles/dot_config/zsh/aliases.zsh

# Apply changes (must specify --source)
chezmoi apply --source=/Users/daniel/code/dangrahn/dotfiles  # macOS
chezmoi apply --source=/home/daniel/code/dangrahn/dotfiles   # Linux

# Commit and push
cd ~/code/dangrahn/dotfiles
git add -A && git commit -m "Update aliases"
git push
```

### With GitHub Clone (Option C)

```bash
# Edit with chezmoi
chezmoi edit ~/.config/zsh/aliases.zsh

# Apply changes
chezmoi apply

# Commit and push from chezmoi's source directory
chezmoi cd
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
