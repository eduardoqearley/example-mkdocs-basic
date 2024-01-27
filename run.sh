#!/bin/bash
# GRAFANA_DIR=$HOME/.grafana
VE_DIR=$HOME/.virtualenv/envs
VE_PROJECT_HOME=$VE_DIR/mkdocs

mkve() { 
    pip install virtualenv
    mkdir $VE_DIR
    virtualenv $VE_PROJECT_HOME 
}
activate(){
    source $VE_PROJECT_HOME/bin/activate
}
install(){
    pip install -r docs/requirements.txt
    # download the binary (adapt os and arch as needed)
}
run(){
    lsof -t -i tcp:3000 | xargs kill
    lsof -t -i tcp:8000 | xargs kill    
    # Run the mkdocs development server
    mkdocs serve
    # firefox docs/_build/html/index.html    
}
all(){
    mkve
    activate
    install
    run
}

# the next line calls the function passed as the first parameter to the script.
# the remaining script arguments can be passed to this function.

$1 $2 $3 $4 $5 


