
# source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"


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
function _set-block-cursor {
  echo -ne '\e[2 q'
  zle reset-prompt
}

zle -N zle-keymap-select _set-block-cursor
zle -N zle-line-finish _set-block-cursor

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

# don't save the wrong command
zshaddhistory() { 
  whence ${${(z)1}[1]} >| /dev/null || return 1 
}

# keybinds 
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^F' autosuggest-accept
