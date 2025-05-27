# Define Plugin Directory
PLUGIN_DIR="$XDG_CONFIG_HOME/zsh/plugins"

# Ensure ~/.config/zsh exists
if [[ ! -d "$PLUGIN_DIR" ]]; then
    echo "Creating $PLUGIN_DIR..."
    mkdir -p "$PLUGIN_DIR"
fi

# Ensure plugins are installed
for plugin in "zsh-autosuggestions" "zsh-syntax-highlighting" "zsh-completions"; do
    if [[ ! -d "$PLUGIN_DIR/$plugin" ]]; then
        echo "Installing $plugin..."
        git clone --depth=1 https://github.com/zsh-users/$plugin.git $PLUGIN_DIR/$plugin
    fi
done

