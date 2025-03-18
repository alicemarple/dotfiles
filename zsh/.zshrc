# Define Plugin Directory
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Ensure ~/.config/zsh exists
if [[ ! -d "$ZSH_CONFIG_DIR" ]]; then
    echo "Creating $ZSH_CONFIG_DIR..."
    mkdir -p "$ZSH_CONFIG_DIR"
fi

# Ensure plugins are installed
for plugin in "zsh-autosuggestions" "zsh-syntax-highlighting" "zsh-completions"; do
    if [[ ! -d "$ZSH_CONFIG_DIR/$plugin" ]]; then
        echo "Installing $plugin..."
        git clone --depth=1 https://github.com/zsh-users/$plugin.git $ZSH_CONFIG_DIR/$plugin
    fi
done

# Load Plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=(~/.config/zsh/zsh-completions)
autoload -Uz compinit && compinit -C

# vi mode setup 
bindkey -v 
export KEYTIMEOUT=1

# Change Cursor Shape in Different Modes
function zle-keymap-select {
  case $KEYMAP in
    vicmd)  echo -ne '\e[1 q' ;; # Block cursor in normal mode
    viins|main) echo -ne '\e[1 q' ;; # Beam cursor in insert mode
  esac
}

# Restore Cursor on Zsh Exit
function zle-line-finish {
  echo -ne '\e[1 q'  # Set cursor back to beam when shell exits
}

# Attach to Zsh Line Editor (ZLE)
zle -N zle-keymap-select
zle -N zle-line-finish

#History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase 
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups 

#aliases
# alias dfzf='fzf -m --preview "bat --style=numbers --color=always {}" --bind "enter:execute(nvim {})+abort"'
alias dfzf='nvim -p $(fzf --preview "bat --color=always --style=numbers --line-range=:100 {}" --multi)'

# starship 
# eval "$(starship init zsh)"
# to fix the FUNCNEST limit error
type starship_zle-keymap-select >/dev/null || \
  {
    echo "Load starship"
    eval "$(/usr/local/bin/starship init zsh)"
  }
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# source fzf
source <(fzf --zsh)

# bat theme
export BAT_THEME="Catppuccin Mocha"

# yazi
export EDITOR="nvim"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init zsh)"

# eza
alias el="eza --all --long --icons=always"
alias et="eza --long --tree --level=3 --icons=always"

# golang file path also golangci-lint path
export PATH=$PATH:/usr/local/go/bin

# keybinds 
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^F' autosuggest-accept
