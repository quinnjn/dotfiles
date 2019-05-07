# Without arguments goes to the dev folder
# With arguments, cds into that repo if it exists in the dev folder or clones it
function git-repo {
  org=$1
  repo=$2

  dev
  cd ..
  cd $org/$repo || git clone git@github.com:$org/$repo.git $org/$repo && cd $org/$repo
}
