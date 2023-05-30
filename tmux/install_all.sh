#!/bin/bash

# Directory to store plugins
PLUGIN_DIR="./plugins"

# Create the directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"

# List of plugins (GitHub repos)
PLUGINS=(
    "tmux-plugins/tmux-sensible"
    "christoomey/vim-tmux-navigator"
    "tmux-plugins/tmux-yank"
    "tmux-plugins/tmux-resurrect"
    "tmux-plugins/tmux-continuum"
    "rose-pine/tmux"
)

# Clone each plugin
for plugin in "${PLUGINS[@]}"; do
    name=$(basename "$plugin")  # e.g., "tmux-sensible"
    target="$PLUGIN_DIR/$name"

    if [ -d "$target" ]; then
        echo "[SKIP] $name already exists in $PLUGIN_DIR"
    else
        echo "[CLONE] Cloning $plugin into $target..."
        git clone "https://github.com/$plugin.git" "$target"
    fi
done

echo "All plugins are cloned into $PLUGIN_DIR"

