# My config

Repository for my config.

## NvChad

Install [Neovim](https://neovim.io/) install [NvChad](https://nvchad.com/docs/quickstart/install):

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

Then copy the content of the NvChad folder to `$XDG_CONFIG_HOME/nvim/lua/custom/`:

```bash
cp -r nvchad/* $XDG_CONFIG_HOME/nvim/lua/custom/
```

In addition, a [Nerd Font](https://www.nerdfonts.com/) should be installed as well as gcc.

## Starship

Install Starship via this [link](https://starship.rs/guide/#%F0%9F%9A%80-installation)

Copy the `starship.toml` file in `$XDG_CONFIG_HOME/`:

```bash
cp starship/starship/toml $XDG_CONFIG_HOME/
```

## Tmux

Install tmux via this [link](https://github.com/tmux/tmux/wiki/Installing)

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

The Prefix is <kbd>ctrl</kbd> + `Space`

Press `Prefix` + `I`


