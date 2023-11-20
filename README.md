# My config

Repository for my config.

## NvChad

Install [Neovim](https://neovim.io/) and install [NvChad](https://nvchad.com/docs/quickstart/install) according to your configuration.

In addition, [Nerd Font](https://www.nerdfonts.com/) should be installed as well as gcc, fzf, and make.

Copy the files to the right folder:

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

Then copy the content of the NvChad folder to `$XDG_CONFIG_HOME/nvim/lua/custom/`:

```bash
cp -r nvchad/* $XDG_CONFIG_HOME/nvim/lua/custom/
```

On the first opening, once all the packages are installed, run the command `:MasonInstallAll`
The supported language are:
    - Python
    - Rust
    - Lua
    - Latex

For the TagBar plugin, please follow the installation instructions [here](https://docs.ctags.io/en/latest/autotools.html)

### Troubleshooting

If telescope require fzf library even though fzf is installed, got to the `telescope-fzf-native` folder, usualy in `~/.local/share/nvim/lazy/` and type `make`

If error `client 2 quit with exit code 127 and signal 0` then check node installation, then restart neovim and run `MasonInstallAll`

## Starship

Install Starship via this [link](https://starship.rs/guide/#%F0%9F%9A%80-installation).

Copy the `starship.toml` file in `$XDG_CONFIG_HOME/`:

```bash
cp starship/starship.toml $XDG_CONFIG_HOME/
```

## Tmux

Install tmux via this [link](https://github.com/tmux/tmux/wiki/Installing).

Install the Tmux Plugin Manager:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Copy the `tmux.conf` into `$XDG_CONFIG_HOME/tmux/`:
```bash
cp tmux/tmux.conf $XDG_CONFIG_HOME/tmux/
tmux source $XDG_CONFIG_HOME/tmux/tmux.conf

```

Apply the changes:

The new Prefix is <kbd>ctrl</kbd> + `Space`

Press `Prefix` + `I` to install the plugins

## Zathura

The `zathurarc` file is here only for the [Zathura](https://pwmt.org/projects/zathura/) use.

To apply them:
```bash
cp zathura/zathurarc $XDG_CONFIG_HOME/zathura/
```
