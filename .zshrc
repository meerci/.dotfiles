export PS1='%n %~ %# '
export PATH='/Users/bao/.local/bin':$PATH
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/opt/homebrew/opt/pyqt@5/5.15.4_1/bin:$PATH"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY


if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

if [ -f ~/.shell.local ]; then
	. ~/.shell.local
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bao/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bao/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bao/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bao/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
#
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light rupa/z

# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search


proxy_host=${proxy_host:-localhost}
# set proxy
function v2() {
	export https_proxy="socks5://${proxy_host}:10810"
	export http_proxy="http://${proxy_host}:10811"
	export all_proxy="socks5://${proxy_host}:10810"
	git config --global http.https://github.com.proxy socks5://${proxy_host}:10810
	echo ok
}

function nov2() {
	export https_proxy=
	export http_proxy=
	export all_proxy=
	git config --unset --global http.https://github.com.proxy
}

# Newly changes
