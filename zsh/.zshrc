##### POWERLEVEL10K INSTANT PROMPT (MUST BE FIRST) #####
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##### PATH SETUP (DEDUPLICATED & ORDERED) #####
typeset -U path PATH
path=(
  $HOME/bin
  /opt/homebrew/bin
  /usr/local/mysql/bin
  $HOME/mongodb-macos-aarch64--8.2.3/bin
  $path
)

##### BASIC ENV #####
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
export EDITOR="nvim"
export VISUAL="nvim"
export JAVA_HOME=$(/usr/libexec/java_home -v 25.0.1 2>/dev/null)

##### ZINIT (PLUGIN MANAGER) #####
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
  mkdir -p "$ZINIT_HOME:h"
  git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

##### PLUGINS #####
zinit ice depth=1
# zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

# better tab completion UI
zinit light Aloxaf/fzf-tab

##### COMPLETION SYSTEM #####
autoload -Uz compinit
compinit -C

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''

# fzf-tab settings
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command 'fzf --ansi --no-sort'
zstyle ':fzf-tab:*' accept-line enter

##### KEYBINDINGS #####
bindkey -e

# history search
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^R' fzf-history-widget

# tab navigation
bindkey '^I' expand-or-complete
bindkey '^[[Z' reverse-menu-complete

##### HISTORY OPTIMIZATION #####
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt share_history
setopt inc_append_history

##### ALIASES #####

# Core
alias ls="eza --icons=always"
alias ll="eza -lah --icons=always --git"
alias la="eza -a --icons=always"
alias tree="eza --tree --icons=always"

alias chad="NVIM_APPNAME=nvim nvim"
alias alt="NVIM_APPNAME=nvim-alt nvim"

alias c='clear'
alias vim='nvim'
alias tt='tree'

# alias python=python3
# alias pip=pip3

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gaa='git add .'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'

# System
alias reload='source ~/.zshrc'
alias path='echo -e ${PATH//:/\\n}'
alias ports='lsof -i -P -n | grep LISTEN'
alias brewup="brew update && brew upgrade && brew cleanup"

##### DOTFILES FUNCTIONS #####

dfpush() {
  cd ~/dotfiles || return
  git add .
  if git diff --cached --quiet; then
    echo "No changes to commit."
    return
  fi
  git commit -m "${1:-update dotfiles}"
  git push
}

dfpull() {
  cd ~/dotfiles || return
  git pull
}

##### NVCHAD UPDATE #####
nvupdate() {
  cd ~/.config/nvim || return
  git pull
  nvim --headless "+Lazy! sync" +qa
  echo "NvChad updated."
}

##### PROJECT HELPERS #####
mkcd() {
  [[ -z "$1" ]] && echo "Usage: mkcd <directory>" && return 1
  mkdir -p "$1" && cd "$1"
}

take() {
  mkcd "$1" && git init
}

##### GIT CLEANUP #####
gclean() {
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

##### ARCHIVE EXTRACTOR #####
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar.xz)  tar xJf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.7z)      7z x "$1" ;;
      *) echo "Cannot extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

##### KILL PORT #####
killport() {
  [[ -z "$1" ]] && echo "Usage: killport <port>" && return 1
  lsof -ti :"$1" | xargs kill -9 2>/dev/null
}

##### FZF #####
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"

# use fd for faster search
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

eval "$(fzf --zsh)"

##### BAT #####
export BAT_THEME="tokyonight_night"

##### ZOXIDE #####
eval "$(zoxide init zsh)"

##### NVM (LAZY LOAD) #####
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  nvm "$@"
}

##### CONDA (MANUAL LOAD) #####
conda() {
  unset -f conda
  [[ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]] && source "$HOME/miniforge3/etc/profile.d/conda.sh"
  conda "$@"
}

##### PROMPT CONFIG #####
# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Starship PROMPT
eval "$(starship init zsh)"
