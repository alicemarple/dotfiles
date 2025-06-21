
# source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"
[ -f "$XDG_CONFIG_HOME/shell/fn" ] && source "$XDG_CONFIG_HOME/shell/fn"


# install plugin
[ -f "$XDG_CONFIG_HOME/zsh/plugins/plugin_install.zsh" ] && source "$XDG_CONFIG_HOME/zsh/plugins/plugin_install.zsh"

# Load Plugins
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fpath+=("$XDG_CONFIG_HOME/zsh/plugins/zsh-completions")
autoload -Uz compinit && compinit -C


# tools
[ -f "$XDG_CONFIG_HOME/zsh/zsh_tools.zsh" ] && source "$XDG_CONFIG_HOME/zsh/zsh_tools.zsh"


# vi mode setup 
bindkey -v

# Always use block cursor
zle -N zle-keymap-select _set-block-cursor
zle -N zle-line-finish _set-block-cursor

#History
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTDUP=erase 
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups 

# keybinds 
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^F' autosuggest-accept

# Auto-start or attach to 'startd' tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux new-session -A -s startd
fi

