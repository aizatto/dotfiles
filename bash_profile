# bash-completion

function __aizatto_add_path {
  [[ -s $1 ]] && export PATH=$PATH:$1
}

function __aizatto_source {
  [[ -s $1 ]] && . $1
}

__aizatto_add_path "$HOME/bin"
__aizatto_add_path "$HOME/src/android-sdk-macosx/tools"
__aizatto_add_path "$HOME/src/android-sdk-macosx/platform-tools"
__aizatto_add_path "$HOME/src/arcanist/bin"
__aizatto_add_path /usr/local/bin
__aizatto_add_path /usr/local/sbin
__aizatto_add_path /opt/local/bin
__aizatto_add_path /opt/local/sbin
__aizatto_add_path /opt/local/apache2/bin
__aizatto_add_path /opt/local/lib/mysql5/bin
__aizatto_add_path /opt/local/lib/postgresql82/bin

__aizatto_source /opt/local/etc/bash_completion
__aizatto_source "$HOME/.rvm/scripts/rvm" # Load RVM function
__aizatto_source "$HOME/.nvm/nvm.sh"

if [ -d /opt/local/man ]; then
  export MANPATH=/opt/local/man:$MANPATH
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export ACK_PAGER='less -R'

alias pign=ping
alias mvimdiff='mvim -d'
alias mysql.server=/opt/local/share/mysql5/mysql/mysql.server

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
