is-port-open () {
  port=$1

  if [[ $(lsof -i :$port | grep LISTEN) ]]; then
    return 0
  fi

  return 1
}

wait-for-port () {
  port=$1

  while ! is-port-open $port; do
    echo -n '.'
  done
}

is-process-running () {
  name=$1
  pgrep $name > /dev/null

  if [ $? == 0 ]; then
    return 0
  fi

  return 1
}

wait-for-process () {
  name=$1

  while is-process-running $name; do
    sleep .5
    echo -n '.'
  done
}
