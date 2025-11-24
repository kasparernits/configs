
HISTFILE=$HOME/.ksh_history
HISTSIZE=1000000
export HISTFILE HISTSIZE

git_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  printf " (%s)" "$branch"
}

# Prompt format: user@host:cwd (branch) $
export PS1='\u@\h:$PWD$(git_branch) $ '

