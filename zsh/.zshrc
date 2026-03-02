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
  /Users/ankitjha/mongodb-macos-aarch64--8.2.3/bin
  $path
)

##### BASIC ENV #####
export HOMEBREW_NO_ENV_HINTS=1
export JAVA_HOME=$(/usr/libexec/java_home -v 25.0.1)

##### ZINIT (PLUGIN MANAGER) #####
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
  mkdir -p "$ZINIT_HOME:h"
  git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

##### PLUGINS (FAST → SLOW ORDER) #####
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

##### COMPLETION SYSTEM (CACHED) #####
autoload -Uz compinit
compinit -C

##### KEYBINDINGS #####
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^R' fzf-history-widget
bindkey '^[w' kill-region

##### HISTORY (OPTIMIZED) #####
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

##### COMPLETION STYLING #####
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:*' switch-group '<' '>'
##### COMPLETION BEHAVIOR (ENHANCED) #####

# Prefix-only, case-insensitive matching
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}'

# Enable menu selection and cycling
zstyle ':completion:*' menu select=long

# Directory-first listing
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' special-dirs true

# Keybindings for cycling
bindkey '^I' expand-or-complete
bindkey '^[[Z' reverse-menu-complete

# fzf-tab behavior
zstyle ':fzf-tab:*' fzf-command 'fzf --ansi --no-sort'
zstyle ':fzf-tab:*' accept-line enter

##### ALIASES #####
alias ls='ls -GF'
alias vim='nvim'
alias c='clear'
alias tt='tree'

##### FZF (LAZY INIT) #####
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"
eval "$(fzf --zsh)"

##### ZOXIDE (FAST) #####
eval "$(zoxide init zsh)"

##### NVM (LAZY LOAD – BIG SPEED WIN) #####
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  source "$NVM_DIR/nvm.sh"
  nvm "$@"
}

##### CONDA (MANUAL LOAD ONLY) #####
conda() {
  unset -f conda
  source /Users/ankitjha/miniforge3/etc/profile.d/conda.sh
  conda "$@"
}

##### PROMPT CONFIG #####
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

