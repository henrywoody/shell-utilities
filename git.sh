alias gitfiles="git diff-tree --no-commit-id --name-only -r"
alias gitgraph="git log --oneline --decorate --graph --all"


gitfix() {
    commit=$1
    git commit -m "FIX"
    git rebase -i $commit
}


alias cl="clear && ls && if git rev-parse --is-inside-work-tree 2> /dev/null
then
  git status
fi"
