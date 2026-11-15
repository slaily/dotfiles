# Dotfiles

Personal macOS environment.

## Install

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init --apply https://github.com/slaily/dotfiles.git
exec zsh
```

## Usage

Apply local changes:

```bash
just apply
```

Pull the latest dotfiles from GitHub and apply them:

```bash
just update
```

Preview what would change without applying:

```bash
just dry-run
```

Install missing Homebrew packages and mise tools:

```bash
just install
```

Uninstall all Homebrew packages/casks and mise tools managed by this dotfiles:

```bash
just uninstall
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
