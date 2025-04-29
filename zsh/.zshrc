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
alias df='nvim -p $(fzf --preview "bat --color=always --style=numbers --line-range=:100 {}" --multi)'

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
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#cdd6f4,fg+:#d0d0d0,bg:-1,bg+:#45475a
  --color=hl:#f38ba8,hl+:#a6e3a1,info:#f5e0dc,marker:#eba0ac
  --color=prompt:#f38ba8,spinner:#45475a,pointer:#f38ba8,header:#f2cdcd
  --color=border:#313244,label:#cdd6f4,query:#d9d9d9
  --preview-window="border-rounded" --prompt="> " --marker="┃" --pointer="▌"
  --separator="─" --scrollbar="│"'

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

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
alias el="eza --all --long"
# alias el="eza --all --long --icons=always"
alias et="eza --long --tree --level=3"
# alias et="eza --long --tree --level=3 --icons=always"

# golang file path also golangci-lint path
export PATH=$PATH:/usr/local/go/bin

# keybinds 
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^F' autosuggest-accept

# syntax
# ZSH_HIGHLIGHT_STYLES[default]='fg=#cdd6f4'   # Lavender color
# ZSH_HIGHLIGHT_STYLES[command]='fg=#cdd6f4'   # Lavender for commands
# ZSH_HIGHLIGHT_STYLES[builtin]='fg=#cdd6f4'   # Lavender for built-in commands
# ZSH_HIGHLIGHT_STYLES[alias]='fg=#cdd6f4'     # Lavender for aliases
