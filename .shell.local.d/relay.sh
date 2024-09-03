function relay() {
  if [ -z "$*" ]; then
    local cmd_with_comment=$(cat ~/.ssh/servers | fzf --height 40% --border)
    local cmd=${cmd_with_comment%%#*} # ignore comments
    if [ ! -z "$cmd" ]; then ~/.ssh/relay "${cmd}"; fi
  else
    if [ "$1" = "--edit" ]; then
      nvim ~/.ssh/servers
    else
      ~/.ssh/relay $*
    fi
  fi
}
