# is-port-open <port>
# Returns 0 if port is open, otherwise 1
is-port-open() {
  port=$1

  if [[ $(lsof -i :$port | grep LISTEN) ]]; then
    return 0
  fi

  return 1
}

# wait-for-port <port>
# Waits for a port to be open
wait-for-port() {
  port=$1

  while ! is-port-open $port; do
    echo -n '.'
  done
}
