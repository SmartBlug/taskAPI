#!/bin/bash 

if [ ! -f ./tag ]; then
  set "";
fi

case "$1" in
    "bash")
        docker exec -i -t $(docker ps --filter "ancestor=${PWD##*/}:`cat tag`" -q) /bin/bash;
        ;;
    "build")
        docker build -t ${PWD##*/}:`cat tag` .;
        ;;
    "clean")
        docker rmi -f $(docker images -f "dangling=true" -q);
        ;;
    "logs")
        docker logs $(docker ps --filter "ancestor=${PWD##*/}:`cat tag`" -q);
        ;;
    "start")
        docker run -p 8080:8080 -i -d --restart always ${PWD##*/}:`cat tag`;
        ;;
    "stop")
        docker stop $(docker ps --filter "ancestor=${PWD##*/}:`cat tag`" -q);
        ;;
    "save")
        docker save -o ${PWD##*/}-`cat tag`.tar ${PWD##*/}:`cat tag`;
        ;;
    *)
        if [ ! -f ./tag ]; then
          echo "File 'tag' not found!";
          echo "you need to create tag file with version number";
        fi  
        echo
        echo "Usage: ./d COMMAND";
        echo
        echo "Commands:";
        echo "  bash    Launch bash command inside container";
        echo "  build   Build docker image";
        echo "  clean   Clean images";
        echo "  logs    Fetch the logs of the container";
        echo "  save    Save docker image";
        echo "  start   Start docker container";
        echo "  stop    Stop docker container";
        ;; 
esac