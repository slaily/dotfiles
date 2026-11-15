# Dotfiles

macOS environment managed with chezmoi, Homebrew, mise, and atuin.

## Install

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init --apply https://github.com/slaily/dotfiles.git
exec zsh
```

## Daily use

```bash
chezmoi apply    # apply local changes
chezmoi update   # pull and apply
```

Or with just:

```bash
just apply
just update
just install
```

## What's installed

- [chezmoi](https://www.chezmoi.io/) — dotfile manager
- [Homebrew](https://brew.sh/) — macOS packages and applications
- [mise](https://mise.jdx.dev/) — dev tools and language runtimes
- [Python](https://www.python.org/) — programming language
- [Node.js](https://nodejs.org/) — programming language
- [Go](https://go.dev/) — programming language
- [zsh](https://www.zsh.org/) with vi mode, autosuggestions, and syntax highlighting
- [starship](https://starship.rs/) — minimal, fast prompt
- [atuin](https://atuin.sh/) — searchable shell history via Ctrl+R
- [zoxide](https://github.com/ajeetdsouza/zoxide) — smart directory jumping
- [bat](https://github.com/sharkdp/bat) — syntax-highlighted file viewer
- [just](https://just.systems/) — command runner for project recipes
- [kitty](https://sw.kovidgoyal.net/kitty/) — GPU-based terminal emulator
- [Caskaydia Cove Nerd Font](https://github.com/ryanoasis/nerd-fonts) — patched font with icons
