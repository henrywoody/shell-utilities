alias cl="clear && ls && if git rev-parse --is-inside-work-tree 2> /dev/null
then
  git status
fi"


alias ggrep="grep -r --exclude={package-lock.json,registerServiceWorker.js,.coverage} --exclude-dir={node_modules,env,build,_build,staticfiles,__pycache__,dist,.cache}"


grepopen() {
    search_term=$1
    directory=$2
    subl -n
    ggrep $search_term $directory | cut -d ":" -f 1 | while read file; do
        subl $file
    done
}
alias ggrepopen="grepopen"


# copy history
cphistory() {
    search_term=$1
    history | grep $search_term | grep -v "cphistory" | tail -1 | cut -d " " -f2- | pbcopy
}


# copy contents
cpc() {
    file_name=$1
    cat $file_name | pbcopy
    echo Copied contents of $file_name
}


# copy database
cpdb() {
    db_name=$1
    db_copy_name=$2
    echo "Copying database $db_name to $db_copy_name"
    timestamp=$(date +%s)
    file_name="/tmp/db-dump-$timestamp.sql"
    pg_dump $db_name > $file_name
    psql postgres -c "CREATE DATABASE $db_copy_name"
    psql $db_copy_name < $file_name
    rm $file_name
}
