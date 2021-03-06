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

__aizatto_add_path "/etc/paths.d"

__aizatto_source "$HOME/.rvm/scripts/rvm" # Load RVM function
__aizatto_source "$HOME/.nvm/nvm.sh"
__aizatto_source "$HOME/src/dotfiles/bash/dotfiles_scm_info.sh"

export PATH=$PATH:./node_modules/.bin/

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
# export LSCOLORS=exfxcxdxbxegedabagacad
export ACK_PAGER='less -R'
export EDITOR=vim
export GIT_EDITOR=$EDITOR

alias pign=ping

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
alias gdd='git diff --name-only HEAD^ | cat'
alias gf='git fetch'
alias gfgsr='git fetch && git svn rebase'
alias gl='git log'
alias gl1='git log -n1'
alias gl1p='git log -n1 -p'
alias gll='git log -p'
alias glg='git log --graph'
alias gp='git pull'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias gs='git status'
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gsr='git svn rebase'
alias gsrgf='git svn rebase && git fetch && git svn rebase'
alias gf='git diff-tree --no-commit-id --name-only -r HEAD'

# http://www.commandlinefu.com/commands/view/11552/open-in-vim-all-modified-files-in-a-git-repository
# https://stackoverflow.com/questions/28280635/how-to-open-all-modified-files-with-git
alias mvimgit='mvim `git ls-files -M`'

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

PS1="\h:\W \u "

# Disable auto complete case sensitivity
bind "set completion-ignore-case on"

alias sfind='find app src'
alias stwig='find app src -iname *.twig'
alias scontroller='find app src -iname *Controller.php'
alias syml='find app src -iname *.yml'
alias sent='find app src -path */Entity/*.php'
alias srepo='find app src -path */Repository/*.php'
alias sbundle='find app src -iname *Bundle'
alias sjs='find app src web -iname "*.js"'
alias sbin='php bin/console'
alias sgraphql='find src -path *GraphQL*.php'

alias fjs='find . -iname "*.js"'
alias fmd='find . -iname "*.md"'
alias fphp='find . -iname "*.php"'
alias fxml='find . -iname "*.xml"'
alias fyml='find . -iname "*.yml"'
alias ftwig='find . -iname "*.twig"'

alias kci='kubectl cluster-info'
alias kd='kubectl describe'
alias kdp='kubectl describe pods'
alias kg='kubectl get'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kgs='kubectl get services'
alias kgp='kubectl get pods'
alias kgrs='kubectl get rs'
alias kgs='kubectl get services'
alias kru='kubectl rollout undo'
alias ks='kubectl scale'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias unixtime='date +%s'
HISTSIZE=
HISTFILESIZE=

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aizat/google-cloud-sdk/path.bash.inc' ]; then . '/Users/aizat/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aizat/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/aizat/google-cloud-sdk/completion.bash.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f "${HOME}/.bash/dotfiles_scm_info.sh" ]; then . "${HOME}/.bash/dotfiles_scm_info.sh"; fi