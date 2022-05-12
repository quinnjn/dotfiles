# Checks if a process is running
is-process-running () {
  name=$1
  pgrep $name > /dev/null

  if [[ $? == 0 ]]; then
    return 0
  fi

  return 1
}

# Wait for a process to stop running
wait-for-process () {
  name=$1

  while is-process-running $name; do
    sleep .5
    echo -n '.'
  done
}
