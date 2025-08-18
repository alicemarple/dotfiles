# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#cdd6f4,fg+:#d0d0d0,bg:-1,bg+:#45475a,pointer:#ff757f'

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
show_file_or_dir_preview="if [ -d {} ]; then eza -aT --icons --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza -aT --icons --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}


# starship
type starship_zle-keymap-select >/dev/null || \
  {
    cat "$HOME/.config/zsh/banner"
    eval "$(/usr/local/bin/starship init zsh)"
  }


# zoxide
eval "$(zoxide init zsh)"

# eza 
export BAT_THEME="Catppuccin Mocha"


