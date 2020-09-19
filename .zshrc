autoload -U compinit
compinit

export LANG=ja_JP.UTF-8

# Viライクキーバインド設定
bindkey -v

# ディレクトリのみ入力してもcdできる設定
setopt auto_cd

# "cd -[タブ]"でこれまでに移動したディレクトリ一覧が表示され、表示されている番号を押してリターンキーで、そのディレクトリへ移動できる。
setopt auto_pushd

# 補完候補を詰めて表示する設定
setopt list_packed

# ビープ音を鳴らさない
setopt nolistbeep

# コマンド入力エラー時の自動修正機能
setopt correct

# パスの最後に付くスラッシュ(/)を自動的に削除させない
setopt noautoremoveslash

# 右側に現在のパスを表示し、入力がぶつかると消える
RPROMPT="[%~]"

# 左側プロンプトの表示と色を設定
case ${UID} in
0)
    PROMPT="%B%{[31m%}%n@%m%%%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%n@%m%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# ターミナルのタイトルを表示
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# コマンド履歴設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# コマンド履歴検索を Ctrl-P と Ctrl-N で行う設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# lsコマンドの色表示(BSD系のみ)
## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

# for ghq & peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
