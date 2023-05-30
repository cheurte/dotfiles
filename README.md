Repository for the neovim configuration. Called it vim though.
Using the lua version with NvChad or the one writen in vimscript should offer
more or less the same experience, all the basic mapping should be the same,
even if the vimscript does not use the <leader> command.
For the lua version, read the NvChad help.

# General
For both install a nerdfont so it can work well:
https://github.com/ryanoasis/nerd-fonts
Then copy and rename on the two folder into nvim/ and add it to your ~/.config
folder.

# Lua
The lua version is only the custom folder that is suppose to be added to the
NvChad configuration.
For NvChad follow : https://github.com/NvChad/NvChad/

Missing :
        - Highlight the line where the cursor is.
        - Make sur it works on windows

# Vimscript
Please install the plugin manager before to start neovim :
https://github.com/junegunn/vim-plug
And then install the plugins with the command :PlugInstall
