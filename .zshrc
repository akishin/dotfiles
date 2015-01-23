function load-if-exists() { test -e "$1" && source "$1" }
function exists { which $1 &> /dev/null }

### Prompt
autoload -Uz promptinit
promptinit
prompt adam1
# adam1 prompt color
# prompt adam1 red white cyan

### History
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt extended_history                # コマンドの開始時刻と経過時間を登録
setopt share_history                   # ヒストリの共有 for GNU Screen
setopt inc_append_history              # 履歴を直ぐに反映
setopt hist_ignore_space               # コマンド行先頭が空白の時登録しない
setopt hist_ignore_all_dups            # 重複ヒストリは古い方を削除
setopt hist_reduce_blanks              # 余分なスペースを削除
# setopt hist_no_store                   # historyコマンドは登録しない

# Use vim keybindings
bindkey -v
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
# インサートモードで Ctrl-A で行頭に戻れるように
bindkey "^A" beginning-of-line
# インサートモードで Ctrl-E で行末に移動出来るように
bindkey "^E" end-of-line

### Change Directory
setopt auto_pushd           # cd 時に Tab 補完
setopt pushd_to_home        # pushd を引数無しで実行した時に pushd ~ とする
setopt pushd_ignore_dups    # ディレクトリスタックに重複する物は古い方を削除
DIRSTACKSIZE=20

# alias settings
load-if-exists ~/dotfiles/.zshrc.alias

# for bundler (bundle open)
export BUNDLER_EDITOR='/usr/bin/vim -g'

# OS specific settings
case ${OSTYPE} in
    # Mac OS
    darwin*)
        load-if-exists ~/dotfiles/.zshrc.osx
        ;;
    # Linux
    linux*)
        load-if-exists ~/dotfiles/.zshrc.linux
        ;;
esac

# local settings
load-if-exists ~/.zshrc.local

### Completion
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

setopt auto_list              # 補完候補を一覧で表示
setopt auto_param_slash       # 補完候補がディレクトリの場合, 末尾に / を追加
setopt list_packed            # 補完候補をできるだけ詰めて表示
setopt list_types             # 補完候補のファイル種別を識別

# for VCS status
# http://mollifier.hatenablog.com/entry/20100906/p1
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"
  zstyle ':vcs_info:git:*' unstagedstr "-"
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
#add-zsh-hook precmd _update_vcs_info_msg
precmd_functions+=(_update_vcs_info_msg)
RPROMPT="%1(v|%F{green}%1v%f|)"

# sudo
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        if [ $arg[1] = '-' ]; then
          args[$(( 1+$#args ))]=$arg
        else
          args[$(( 1+$#args ))]="sudo:$arg"
        fi
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}

# tmuxinator
load-if-exists $HOME/.tmuxinator/scripts/tmuxinator

# tmux( or tmuxinator)
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux attach
  elif [ -x "`which mux 2>/dev/null`" ]; then
    # tmuxinator
    mux devel
  else
    # new tmux session
    tmux
  fi
fi

if exists tmux; then
  function ssh() {
      local window_name=$(tmux display -p '#{window_name}')
      command ssh $@
      tmux rename-window $window_name
  }
fi

# z.sh
load-if-exists ~/z/z.sh

# peco or percol
if exists peco; then
  PERCOL_COMMAND=peco
elif exists percol; then
  PERCOL_COMMAND=percol
fi
if [ -n $PERCOL_COMMAND ]; then
    function ppgrep() {
        if [[ $1 == "" ]]; then
            PERCOL=$PERCOL_COMMAND
        else
            PERCOL="${PERCOL_COMMAND} --query $1"
        fi
        ps aux | eval $PERCOL | awk '{ print $2 }'
    }

    function ppkill() {
        if [[ $1 =~ "^-" ]]; then
            QUERY=""            # options only
        else
            QUERY=$1            # with a query
            [[ $# > 0 ]] && shift
        fi
        ppgrep $QUERY | xargs kill $*
    }

    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(history -n 1 | eval $tac | $PERCOL_COMMAND --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    zle -N percol_select_history
    bindkey '^R' percol_select_history

    function percol_select_directory() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        local dest=$(_z -r 2>&1 | eval $tac | $PERCOL_COMMAND --query "$LBUFFER" | awk '{ print $2 }')
        if [ -n "${dest}" ]; then
            cd ${dest}
        fi
        zle reset-prompt
    }
    zle -N percol_select_directory
    bindkey '^J' percol_select_directory
fi
