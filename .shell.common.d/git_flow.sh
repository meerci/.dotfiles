trace_exec() {
  if [ -n "$GIT_FLOW_TRACE" ]; then echo "$@"; fi
  "$@"
}

flow() {
  local command="$1"
  if [ -z "$command" ]; then
    flow-usage
    return 1
  fi
  shift

  if [ "${command}" = "base" ]; then
    flow-base "$@"
  elif [ "${command}" = "branch" ]; then
    flow-new-branch $@
  elif [ "${command}" = "br" ]; then
    flow-new-branch $@
  elif [ "${command}" = "fix" ]; then
    flow-new-branch fix-$1
  elif [ "${command}" = "feat" ]; then
    flow-new-branch feat-$1
  elif [ "${command}" = "neat" ]; then
    flow-new-branch neat-$1
  elif [ "${command}" = "cr" ]; then
    flow-cr
  elif [ "${command}" = "list" ]; then
    flow-list
  elif [ "${command}" = "l" ]; then
    flow-list
  elif [ "${command}" = "select" ]; then
    flow-select $1
  elif [ "${command}" = "s" ]; then
    flow-select $1
  elif [ "${command}" = "help" ]; then
    flow-usage
  else
    echo "unrecognized command ${command}"
    flow-usage
    return 1
  fi
}

flow-usage() {
  echo "usage: flow [base | cr | list | select | branch | help | fix | feat | neat]"
}

flow-base() {
  local branch_path=$(git config --get branch.$(git branch --show-current).merge)
  local remote_branch_name=${branch_path##*/}

  trace_exec git checkout $remote_branch_name
}

# create and checkout to a new feature branch
flow-new-branch() {
  local new_branch="$1"
  if [ -z "${new_branch}" ]; then echo "please specify the name" && return 1; fi

  local remote=$(git config --get branch.$(git branch --show-current).remote)
  local branch_path=$(git config --get branch.$(git branch --show-current).merge)
  local remote_branch_name=${branch_path##*/}

  if [ ! -z "${remote}" ] && [ ! -z "${remote_branch_name}" ]; then
    trace_exec git checkout -b $new_branch ${remote}/$remote_branch_name
    trace_exec git config --local branch.${new_branch}.remote $remote
  else
    trace_exec git checkout -b $new_branch
  fi
  trace_exec git config --local branch.${new_branch}.merge $branch_path
}

# push current branch to gerrit
flow-cr() {
  local remote=$(git config --get branch.$(git branch --show-current).remote)
  local branch_path=$(git config --get branch.$(git branch --show-current).merge)
  local remote_branch_name=${branch_path##*/}

  if [ -z "${remote}" ]; then echo "empty remote" && return 1; fi
  if [ -z "${remote_branch_name}" ]; then echo "empty branch name" && return 1; fi

  trace_exec git push $remote HEAD:refs/for/$remote_branch_name
}

flow-list() {
  trace_exec git for-each-ref --sort=-committerdate refs/heads/ --format="%(committerdate:short) | %(align:40,left)%(refname:short)%(end) | %(subject)" | nl
}

flow-select() {
  local filt=$1

  if [ -z "$filt" ]; then
    echo "usage: flow select <number or filter>"
    return 1
  fi

  # for number, select n-th branch; for other, select first match
  if [[ "$filt" =~ ^[0-9]+$ ]]; then
    local branch=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)" | sed -n "${filt}p")
  else
    local branch=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)" | grep -m 1 $filt)
  fi

  if [ -z "$branch" ]; then
    echo "no matching branch"
    return 1
  fi

  trace_exec git checkout $branch
}
