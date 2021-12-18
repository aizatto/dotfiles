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

# __aizatto_source "$HOME/.rvm/scripts/rvm" # Load RVM function
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

__aizatto_source "./bash/aliases"

# http://www.commandlinefu.com/commands/view/11552/open-in-vim-all-modified-files-in-a-git-repository
# https://stackoverflow.com/questions/28280635/how-to-open-all-modified-files-with-git
alias mvimgit='mvim `git ls-files -M`'

hbrm() {
  hg bookmark -r master $1 && hg update $1
}

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*