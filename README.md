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

1. Clone this repository anywhere:

```bash
git clone https://github.com/slaily/dotfiles.git ~/path/to/dotfiles
cd ~/path/to/dotfiles
```

2. Install all packages (symlinks are created in `~`):

```bash
stow -t ~ kitty starship zshrc
```

Or install packages individually:

```bash
stow -t ~ kitty     # Kitty terminal
stow -t ~ starship  # Starship prompt
stow -t ~ zshrc     # Zsh configuration
```

## Uninstalling

Remove symlinks for specific packages:

```bash
stow -t ~ -D kitty starship zshrc
```

## Updating

Pull the latest changes and re-stow:

```bash
git pull
stow -t ~ -R kitty starship zshrc
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
