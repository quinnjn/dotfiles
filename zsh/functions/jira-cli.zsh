jira-issues() {
  local assignee=${1:=$(jira me)}
  command jira issue list --plain --assignee $assignee
}
