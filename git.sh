alias gitfiles="git diff-tree --no-commit-id --name-only -r"
alias gitgraph="git log --oneline --decorate --graph --all"
alias gitrenamemain="git symbolic-ref HEAD refs/heads/main"

gitfix() {
    commit=$1
    git commit -m "FIX"
    git rebase -i $commit
}

alias cl="clear && ls && if git rev-parse --is-inside-work-tree 2> /dev/null
then
    git status
fi"

getgitignore() {
    language=$1
    curl https://raw.githubusercontent.com/github/gitignore/master/$language.gitignore
}