source ~/.profile

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

source ~/git-completion.bash
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.keys ] && source ~/.keys

export PS1="\[\e[00;37m\]\w\$(git_branch)\n🍙  \[\e[0m\]"

eval "$(rbenv init -)"
