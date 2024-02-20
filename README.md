<h1 align="center"> ✨ Config perso ✨ </h1>

Repository for my config for Neovim, tmux, starship and Zathura.
They are installation script for each of them (except Zathura), they are configured to work on fedora and Ubuntu/Debian.

The Dockerfile is not ready yet, and it is just there to run Neovim within a container. DO NOT USE IT

## Neovim

The Neovim configuration is using NvChad. You can either install Neovim and NvChad automatically by running:

```bash
sudo chmod +x ./nvim_installation.sh && ./nvim_installation.sh
```

Or install everything manually:

- Install [Neovim](https://neovim.io/), a [Nerd Font](https://www.nerdfonts.com/) should be installed, as well as git nodejs, neovim, ripgrep, build-base, cmake, fzf and ripgrep.

- Finally, copy the configuration folder:

```bash
cp -r dotfiles/nvim/ ~/.config/nvim/
```

### Troubleshooting

- If telescope require fzf library even though fzf is installed, got to the `telescope-fzf-native` folder, usually in `~/.local/share/nvim/lazy/` and type `make`

- If error `client 2 quit with exit code 127 and signal 0` then check node installation, then restart Neovim and run `MasonInstallAll`

## Starship

Install everything automatically with the installation script:

```bash
sudo chmod +x ./starship_installation.sh && ./starship_installation.sh
```

Or, install Starship via this [link](https://starship.rs/guide/#%F0%9F%9A%80-installation), and copy the `starship.toml` file in `$XDG_CONFIG_HOME/`:

```bash
cp dotfiles/starship/starship.toml $XDG_CONFIG_HOME/
```

## Tmux

Install everything automatically with the installation script:

```bash
sudo chmod +x ./tmux_installation.sh && ./tmux_installation.sh
```

Or install it manually:

- Install tmux via this [link](https://github.com/tmux/tmux/wiki/Installing).

- Install the Tmux Plugin Manager:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Copy the `tmux.conf` into `$XDG_CONFIG_HOME/tmux/`:

```bash
cp dotfiles/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/
tmux source $XDG_CONFIG_HOME/tmux/tmux.conf
```

Apply the changes:

The new Prefix is <kbd>ctrl</kbd> + `Space`

Press `Prefix` + `I` to install the plugins

## Zathura

No installation script yet.

The `zathurarc` file is here only for the [Zathura](https://pwmt.org/projects/zathura/) use.

To apply them:

```bash
cp dotfiles/zathura/zathurarc $XDG_CONFIG_HOME/zathura/
```
