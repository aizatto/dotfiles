# bash-completion

function __aizatto_add_path {
  [[ -d $1 ]] && export PATH=$1:$PATH
}

function __aizatto_source {
  [[ -s $1 ]] && . $1
}

# Order from least priority to highest priority
__aizatto_add_path /usr/local/bin
__aizatto_add_path /usr/local/sbin

__aizatto_add_path "$HOME/bin"
__aizatto_add_path "$HOME/src/android-sdk-macosx/tools"
__aizatto_add_path "$HOME/src/android-sdk-macosx/platform-tools"
__aizatto_add_path "$HOME/src/arcanist/bin"

__aizatto_source "$HOME/.rvm/scripts/rvm" # Load RVM function
__aizatto_source "$HOME/.nvm/nvm.sh"

# Load OS specific stuff
case `uname` in
  'Darwin' )
    . ~/.bash/mac
  ;;
esac

__aizatto_add_path /usr/local/go/bin

command src-hilite-lesspipe.sh 2> /dev/null
[[ $? -eq "0" ]] && export LESSOPEN="| `which src-hilite-lesspipe.sh` %s"
export LESS=' -R'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export ACK_PAGER='less -R'
export EDITOR=vim
export GIT_EDITOR=$EDITOR

alias pign=ping
alias ad='arc lint && arc diff'
alias au='arc unit'
alias ap='arc pull && arc build'

af() {
  arc pull && arc feature $1 && arc pull && arc build
}

alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gau='git add -u'
alias gca='git commit --amend --no-edit'
alias gci='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gdc='git diff --cached'
alias gd='git diff'
alias gf='git fetch'
alias gfgsr='git fetch && git svn rebase'
alias gl='git log'
alias gl1='git log -n1'
alias gl1p='git log -n1 -p'
alias gll='git log -p'
alias gp='git pull'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias gs='git status'
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gsr='git svn rebase'
alias gsrgf='git svn rebase && git fetch && git svn rebase'

hbrm() {
  hg bookmark -r master $1 && hg update $1
}

alias hb='hg bookmark'
alias hca='hg commit --amend'
alias hd='hg diff'
alias hl1='hg log -l 1'
alias hl1p='hg log -l 1 -p'
alias hlcl='hg log --style changelog'
alias hl='hg log'
alias hp='hg pull'
alias hrc='hg rebase --continue'
alias hrdd='hg rebase -d default'
alias hrdm='hg rebase -d master'
alias hrl='hg resolve --list'
alias hrm='hg resolve --mark'
alias hru='hg resolve --unmark'
alias hs='hg status'
alias hsn='hg status --no-status'
alias hgfiles='hg status --no-status --change .'
alias hu='hg update'
alias huc='hg update --check'
alias huC='hg update --clean'

green=$'\e[1;32m'
magenta=$'\e[1;35m'
normal_colours=$'\e[m'

vcs_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null | awk '{print $1}'
  hg bookmark 2>/dev/null | grep '*' | awk '{print $2}'
}

PS1="\h:\W \u "
PS1="${PS1:0:$((${#PS1} - 3))}\[$green\]\$(vcs_branch)\[$normal_colours\]\$ "

# Disable auto complete case sensitivity
bind "set completion-ignore-case on"
