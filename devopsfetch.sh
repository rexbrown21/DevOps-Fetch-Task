#!/bin/bash

# Function to list active ports
list_ports() {
    if [ -n "$1" ]; then
        lsof -i :$1
    else
        ss -tuln
    fi
}

# Function to list Docker images and containers
list_docker() {
    if [ -n "$1" ]; then
        docker inspect $1
    else
        docker ps -a
        docker images
    fi
}

# Function to list Nginx domains and ports
list_nginx() {
    if [ -n "$1" ]; then
        cat /etc/nginx/sites-available/$1
    else
        ls /etc/nginx/sites-available
    fi
}

# Parsing command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--port)
            PORT=$2
            shift
            ;;
        -d|--docker)
            DOCKER=$2
            shift
            ;;
        -n|--nginx)
            NGINX=$2
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [-p port] [-d docker] [-n nginx] [-h help]"
            exit 0
            ;;
        *)
            echo "Unknown parameter passed: $1"
            echo "Usage: $0 [-p port] [-d docker] [-n nginx] [-h help]"
            exit 1
            ;;
    esac
    shift
done

# Execute the appropriate function based on the arguments
if [ -n "$PORT" ]; then
    list_ports $PORT
elif [ -n "$DOCKER" ]; then
    list_docker $DOCKER
elif [ -n "$NGINX" ]; then
    list_nginx $NGINX
else
    echo "No valid arguments provided"
    echo "Usage: $0 [-p port] [-d docker] [-n nginx] [-h help]"
    exit 1
fi
