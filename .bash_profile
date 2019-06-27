if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export EDITOR=vim

export PS1="\[\e[00;37m\]\w\$(git_branch)\n🍙  \[\e[0m\]"


# ghf - [G]rep [H]istory [F]or top ten commands and execute one
# usage:
#  Most frequent command in recent history
#   ghf
#  Most frequent instances of {command} in all history
#   ghf {command}
#  Execute {command-number} after a call to ghf
#   !! {command-number}
function latest-history { history | tail -n 50 ; }
function grepped-history { history | grep "$1" ; }
function chop-first-column { awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}' ; }
function add-line-numbers { awk '{print NR " " $0}' ; }
function top { sort | uniq -c | sort -r | head -n 100 ; }
function unique-history { chop-first-column | top | chop-first-column | add-line-numbers ; }
function ghf {
  if [ $# -eq 0 ]; then latest-history | unique-history; fi
  if [ $# -eq 1 ]; then grepped-history "$1" | unique-history; fi
  if [ $# -eq 2 ]; then
    `grepped-history "$1" | unique-history | grep ^$2 | chop-first-column`;
  fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
