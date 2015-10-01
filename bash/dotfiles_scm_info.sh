# vim:ft=sh:  -*-sh-*-

# Determines the "branch" of the current repo and emits it.
# For use in generating the prompt.
# This is portable to both zsh and bash and works in both
# git and mercurial repos and aims to avoid invoking the
# command line utilities for speed of prompt updates

# To use from zsh:
#  NOTE! the single quotes are important; if you use double quotes
#  then the prompt won't change when you chdir or checkout different
#  branches!
#
#  setopt PROMPT_SUBST
#  export PS1='$(_dotfiles_scm_info)$USER@%m:%~%% '

# To use from bash:
#  NOTE! the single quotes are important; if you use double quotes
#  then the prompt won't change when you chdir or checkout different
#  branches!
#
#  export PS1='$(_dotfiles_scm_info)\u@\h:\W\$ '

_dotfiles_scm_info()
{
  # find out if we're in a git or hg repo by looking for the control dir
  local d git hg
  d=$PWD
  while : ; do
    if test -d "$d/.git" ; then
      git=$d
      break
    elif test -d "$d/.hg" ; then
      hg=$d
      break
    fi
    test "$d" = / && break
    # portable "realpath" equivalent
    d=$(cd "$d/.." && echo "$PWD")
  done

  local br
  if test -n "$hg" ; then
    local file
    for file in "$hg/.hg/bookmarks.current" "$hg/.hg/branch" ; do
      test -f "$file" && { read br < "$file" ; break; }
    done
  elif test -n "$git" ; then
    if test -f "$git/.git/HEAD" ; then
      read br < "$git/.git/HEAD"
      case $br in
        ref:\ refs/heads/*) br=${br#ref: refs/heads/} ;;
        *) # Lop off all of an SHA1 except the leading 7 hex digits.
           # Use this cumbersome notation (it's portabile) rather
           # than ${head:0:7}, which doesn't work with older zsh.
          br="DETACHED @ ${br%?????????????????????????????????}" ;;
      esac
    fi
  fi
  test -n "$br" && printf %s "$br" || :
}
