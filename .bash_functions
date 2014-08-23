# # put below lines to '.bashrc'
# if [ -f ~/.bash_functions ]; then
#     . ~/.bash_functions
# fi
pecorake() {
    local rake="bundle exec rake"
    local task=$($rake --tasks | peco --prompt="task>" | cut -d " " -f 2)
    [ ! -z $task ] && $rake $task
  }
alias prake='pecorake'

follow_upstream() {
  git fetch --prune origin upstream
  git checkout master
  git merge --ff-only upstream/master
  git push origin master
}

_peco_checkout_branch() {
  branches=$(git for-each-ref --format="%(refname:short)" --sort=-committerdate refs/heads)
  branch=$(echo "$branches" | peco --prompt="Branch>")
  git checkout $branch

  git branch --verbose
}
alias co='_peco_checkout_branch'
