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
__aizatto_add_path /opt/local/bin
__aizatto_add_path /opt/local/sbin
__aizatto_add_path /opt/local/apache2/bin
__aizatto_add_path /opt/local/pear/bin
__aizatto_add_path /opt/local/lib/mysql5/bin
__aizatto_add_path /opt/local/share/mysql5/mysql/
__aizatto_add_path /opt/local/lib/postgresql82/bin
__aizatto_add_path /usr/local/go/bin
__aizatto_add_path "$HOME/bin"
__aizatto_add_path "$HOME/src/android-sdk-macosx/tools"
__aizatto_add_path "$HOME/src/android-sdk-macosx/platform-tools"
__aizatto_add_path "$HOME/src/arcanist/bin"

__aizatto_source /opt/local/etc/bash_completion
__aizatto_source "$HOME/.rvm/scripts/rvm" # Load RVM function
__aizatto_source "$HOME/.nvm/nvm.sh"

if [ -d /opt/local/man ]; then
  export MANPATH=/opt/local/man:$MANPATH
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export ACK_PAGER='less -R'
export EDITOR=vim
export GIT_EDITOR=$EDITOR

alias pign=ping
alias mvimdiff='mvim -d'

alias ad='arc diff'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gau='git add -u'
alias gca='git commit --amend --no-edit'
alias gci='git commit'
alias gco='git checkout'
alias gdc='git diff --cached'
alias gd='git diff'
alias gl='git log'
alias gl1='git log -n1'
alias gl1p='git log -n1 -p'
alias gll='git log -p'
alias grc='git rebase --continue'
alias gs='git status'

# For git goodness
# Copied from http://aaroncrane.co.uk/2009/03/git_branch_prompt/
function find_git_branch {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head == ref:\ refs/heads/* ]]; then
                git_branch=" ${head##*/}"
            elif [[ $head != '' ]]; then
                git_branch=' (detached)'
            else
                git_branch=' (unknown)'
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

green=$'\e[1;32m'
magenta=$'\e[1;35m'
normal_colours=$'\e[m'

PS1="\h:\W \u "
PS1="${PS1:0:$((${#PS1} - 3))}\[$green\]\$git_branch\[$normal_colours\]\$ "
