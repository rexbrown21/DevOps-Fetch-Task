
Overview

devopsfetch is a command-line tool designed for DevOps to collect and display comprehensive server information. It covers active ports, user logins, Nginx configurations, Docker images, and container statuses. Additionally, it includes a systemd service for continuous monitoring and logging.

Features

Information Retrieval

Ports

All Active Ports: Display all active ports and their associated services.
devopsfetch -p
Specific Port: Display detailed information about a specific port.
devopsfetch -p <port_number>
Docker

All Docker Images and Containers: List all Docker images and containers.
devopsfetch -d
Specific Container: Display detailed information about a specific container.
devopsfetch -d <container_name>
Nginx

All Nginx Domains: Display all Nginx domains and their configurations.
devopsfetch -n
Specific Domain: Provide detailed configuration information for a specific domain.
devopsfetch -n <domain>
Users

All Users: List all users and their last login times.
devopsfetch -u
Specific User: Provide detailed information about a specific user.
devopsfetch -u <username>
Time Range

Activities Within a Time Range: Display system activities within a specified time range.
devopsfetch -t 'YYYY-MM-DD HH:MM:SS' 'YYYY-MM-DD HH:MM:SS'
Output Formatting

Outputs are formatted in readable tables with descriptive column names for clarity.
