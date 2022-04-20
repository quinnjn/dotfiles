git_prompt() {
  local s=""
  if ! git rev-parse --is-inside-work-tree >/dev/null; then
    # Not in a git repo
    return
  fi

  if ! git rev-parse --is-inside-git-dir >/dev/null; then
    # Not in a git dir
    return
  fi

  # check for uncommitted changes in the index
  if ! $(git diff --quiet --ignore-submodules --cached); then
    s+="+";
  fi

  # check for unstaged changes
  if ! $(git diff-files --quiet --ignore-submodules --); then
    s+="!";
  fi

  # check for untracked files
  if [ -n "$(git ls-files --others --exclude-standard)" ]; then
    s+="?";
  fi

  # check for stashed files
  if $(git rev-parse --verify refs/stash &>/dev/null); then
    s+="$";
  fi

  local branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
    git rev-parse --short HEAD 2> /dev/null || \
    printf "(unknown)")"

  printf "%s" " on %{$fg[blue]%}${branchName} [$s]%{$reset_color%}"
}

prompt() {
  local prompt=""

  # Display current user
  prompt+="%{$fg[red]%}%n%{$reset_color%}"

  # Display current machine
  prompt+=" at "
  prompt+="%{$fg[yellow]%}%m%{$reset_color%}"

  # Display working directory
  prompt+=" in "
  prompt+="%{$fg[green]%}%~%{$reset_color%}"

  # TODO Display git details
  # prompt+="$(git_prompt)"

  prompt+="\n"
  prompt+="$ "

  echo $prompt
}

PS1=$(prompt)
