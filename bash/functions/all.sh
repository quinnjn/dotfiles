# Copies a template file 
template() {
  template=$1
  to=$2

  cp ~/.templates/$1 $2
}
