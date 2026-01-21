# Dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

### macOS

```bash
brew install stow
```

### Linux (Debian/Ubuntu)

```bash
sudo apt install stow
```

### Linux (Fedora)

```bash
sudo dnf install stow
```

### Linux (Arch)

```bash
sudo pacman -S stow
```

## Installation

1. Clone this repository:

```bash
git clone https://github.com/slaily/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Install all packages:

```bash
stow kitty starship zshrc
```

Or install packages individually:

```bash
stow kitty     # Kitty terminal
stow starship  # Starship prompt
stow zshrc     # Zsh configuration
```

## Uninstalling

Remove symlinks for specific packages:

```bash
stow -D kitty starship zshrc
```

## Updating

Pull the latest changes and re-stow:

```bash
git pull
stow -R kitty starship zshrc
```

## Structure

```
dotfiles/
├── kitty/
│   └── .config/
│       └── kitty/
│           ├── kitty.conf
│           └── current-theme.conf
├── starship/
│   └── .config/
│       └── starship.toml
└── zshrc/
    ├── .zshrc
    └── .zsh_aliases
```

## Troubleshooting

If stow reports conflicts, existing files may need to be backed up first:

```bash
mv ~/.zshrc ~/.zshrc.bak
mv ~/.config/kitty ~/.config/kitty.bak
```

Then re-run the stow commands.
