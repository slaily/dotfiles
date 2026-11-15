# AGENTS.md

## Project overview

This repository manages a personal macOS environment using:

- [chezmoi](https://www.chezmoi.io/) for dotfiles
- [Homebrew](https://brew.sh/) for macOS packages and apps
- [mise](https://mise.jdx.dev/) for dev tools and runtimes

## Dev environment tips

- Files and directories prefixed with `dot_` become hidden dotfiles/directories in `$HOME`.
  - `dot_zshrc` → `~/.zshrc`
  - `dot_Brewfile` → `~/.Brewfile`
  - `dot_config/kitty/kitty.conf` → `~/.config/kitty/kitty.conf`
- `.chezmoiscripts/` contains automated setup steps executed by chezmoi.
- Add macOS apps/packages in `dot_Brewfile`.
- Add dev tools/runtimes in `dot_config/mise/config.toml`.
- Add local convenience commands in `justfile`.

## Scripts

Located in `.chezmoiscripts/`:

- `run_once_before_00-install-brew.sh` — installs Homebrew once per machine before applying files.
- `run_onchange_brew-bundle.sh.tmpl` — runs `brew bundle --global` when `~/.Brewfile` changes.
- `run_onchange_mise-install.sh.tmpl` — runs `mise install` when `~/.config/mise/config.toml` changes.

The `run_onchange_` scripts include a hash of their config file so chezmoi re-runs them automatically when the config changes.

## Testing instructions

Before committing changes, dry-run them:

```bash
chezmoi apply --dry-run --verbose
```

Verify scripts render correctly:

```bash
chezmoi execute-template < .chezmoiscripts/run_onchange_brew-bundle.sh.tmpl
```

After editing the Brewfile or mise config, apply and confirm the install scripts run:

```bash
chezmoi apply
```

## Commit guidelines

Follow [Conventional Commits](https://www.conventionalcommits.org/).