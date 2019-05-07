# connect
# Creates or connect to a tmux session. Otherwise lists tmux sessions
function connect {
  [[ $1 -ne "" ]]
  if [ $# -eq 0 ]; then
    tmux ls
  else
    tmux new-session -A -s $1
  fi
}
