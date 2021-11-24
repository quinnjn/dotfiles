# Copies a template file 
template() {
  template=$1
  to=$2

  cp ~/.templates/$1 $2
}

# Checks if a process is running
is-process-running () {
  keywords=$@
  pscount=$(ps aux | grep -E "${keywords// /|}" | wc -l)
  echo $pscount

  if [ $pscount -gt 1 ]; then
    return 0
  fi

  return 1
}
