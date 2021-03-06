export EDITOR=vim

function csvview { column -s, -tn < "$1"; }
export -f csvview
function csvless { column -s, -t < "$1" | less -#2 -N -S; } 
export -f csvless

#some git niceness
alias gitv="git --no-pager log --graph --full-history --all --color --date=short --date-order --pretty=format:\"%Cred%x09%h %Creset%ad%Cblue%d %Creset %s %C(bold)(%an)%Creset\" | head"
export LESS=R

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  cmdtime=$(($SECONDS - $timer))
  if (( $cmdtime > 10 )); then
    timer_show="[${cmdtime}s]"
  else
    timer_show=""
  fi 
  unset timer
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

# Shorthand for trash
alias t=trash

export PS1='\[\e[1;91m\]${timer_show}\[\e[1;32m\]<\t>\h:\w$\[\e[0m\] '

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
