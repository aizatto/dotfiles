# bash-completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

if [ -d $HOME/bin ]; then
  export PATH=$HOME/bin:$PATH
fi

for i in apache2/bin lib/mysql5/bin lib/postgresql82/bin; do
  export PATH=/opt/local/$i:$PATH
done

PATH=$PATH:/usr/local/bin

if [ -d /opt/local/man ]; then
  export MANPATH=/opt/local/man:$MANPATH
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
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

PS1="${PS1:0:$((${#PS1} - 3))}\[$green\]\$git_branch\[$normal_colours\]\$ "
