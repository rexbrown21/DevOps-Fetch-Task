#!/bin/bash

# Function to display active ports and services
function display_ports() {
    if [ -z "$1" ]; then
        sudo netstat -tuln
    else
        sudo netstat -tuln | grep ":$1 "
    fi
}

# Function to display Docker images and containers
function display_docker() {
    if [ -z "$1" ]; then
        echo "REPOSITORY   TAG       IMAGE ID   CREATED   SIZE"
        sudo docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}"
        echo
        echo "CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES"
        sudo docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
    else
        sudo docker inspect "$1"
    fi
}

# Function to display Nginx domains and ports
function display_nginx() {
    echo "+----------------------------------+--------------------+-----------------------------------------+"
    echo "|           Server Domain          |       Proxy        |          Configuration File             |"
    echo "+----------------------------------+--------------------+-----------------------------------------+"

    for file in /etc/nginx/sites-enabled/*; do
        server_name=$(grep 'server_name' $file | awk '{print $2}' | tr -d ';')
        proxy_pass=$(grep 'proxy_pass' $file | awk '{print $2}' | tr -d ';')
        config_file=$(realpath $file)
        printf "| %-32s | %-18s | %-39s |\n" "$server_name" "$proxy_pass" "$config_file"
    done

    echo "+----------------------------------+--------------------+-----------------------------------------+"
}

# Function to display users and last login times
function display_users() {
    if [ -z "$1" ]; then
        who
    else
        last "$1"
    fi
}

# Function to display activities within a specified time range
function display_time_range() {
    last -s "$1"
}

# Function to display help
function display_help() {
    echo "Usage: $0 [option] [argument]"
    echo
    echo "Options:"
    echo "  -p [port_number]      Display active ports and services. If port_number is provided, display details for that port."
    echo "  -d [container_name]   Display Docker images and containers. If container_name is provided, display details for that container."
    echo "  -n [domain]           Display Nginx domains and ports. If domain is provided, display details for that domain."
    echo "  -u [username]         Display users and last login times. If username is provided, display details for that user."
    echo "  -t [time_range]       Display activities within a specified time range."
    echo "  -h                    Display this help message."
}

# Parse command-line arguments
while getopts "p:d:n:u:t:h" opt; do
    case "$opt" in
        p) display_ports "$OPTARG" ;;
        d) display_docker "$OPTARG" ;;
        n) display_nginx "$OPTARG" ;;
        u) display_users "$OPTARG" ;;
        t) display_time_range "$OPTARG" ;;
        h) display_help ;;
        *) display_help ;;
    esac
done

# If no arguments are provided, display help
if [ $# -eq 0 ]; then
    display_help
fi

