DevOps Fetch Task
Introduction
The DevOps Fetch Task is a Bash-based tool designed to collect and display system information relevant to DevOps operations. It retrieves details such as active ports, Docker containers, Nginx configurations, and user login details. This tool also supports setting up a monitoring service to continuously log these activities.

Features
Ports:

Display all active ports and services.
Provide detailed information about a specific port.
Docker:

List all Docker images and containers.
Provide detailed information about a specific container.
Nginx:

Display all Nginx domains and their ports.
Provide detailed configuration information for a specific domain.
Users:

List all users and their last login times.
Provide detailed information about a specific user.
Time Range:

Display activities within a specified time range.
Usage
Displaying Active Ports and Services
bash
Copy code
./devopsfetch.sh -p
Displaying Detailed Information for a Specific Port
bash
Copy code
./devopsfetch.sh -p <port_number>
Listing Docker Images and Containers
bash
Copy code
./devopsfetch.sh -d
Displaying Detailed Information for a Specific Container
bash
Copy code
./devopsfetch.sh -d <container_name>
Displaying Nginx Domains and Ports
bash
Copy code
./devopsfetch.sh -n
Displaying Detailed Configuration for a Specific Domain
bash
Copy code
./devopsfetch.sh -n <domain>
Listing Users and Last Login Times
bash
Copy code
./devopsfetch.sh -u
Displaying Detailed Information for a Specific User
bash
Copy code
./devopsfetch.sh -u <username>
Displaying Activities Within a Specified Time Range
bash
Copy code
./devopsfetch.sh -t <time_range>
Installation
Prerequisites
Ensure you have the following installed:

Bash
Docker (for Docker-related commands)
Nginx (for Nginx-related commands)
Installation Steps
Clone the repository:

bash
Copy code
git clone https://github.com/rexbrown21/DevOps-Fetch-Task.git
cd DevOps-Fetch-Task
Make the script executable:

bash
Copy code
chmod +x devopsfetch.sh
Run the script:

bash
Copy code
./devopsfetch.sh
Setting Up Continuous Monitoring
Create a systemd service file:

bash
Copy code
sudo nano /etc/systemd/system/devopsfetch.service
Add the following content to the service file:

ini
Copy code
[Unit]
Description=DevOps Fetch Monitoring Service

[Service]
ExecStart=/path/to/devopsfetch.sh -m
Restart=always

[Install]
WantedBy=multi-user.target
Replace /path/to/devopsfetch.sh with the actual path to your devopsfetch.sh script.

Reload systemd and start the service:

bash
Copy code
sudo systemctl daemon-reload
sudo systemctl start devopsfetch.service
sudo systemctl enable devopsfetch.service
Logging and Help
Logging
Logs are stored in /var/log/devopsfetch.log. Ensure proper log rotation is set up to manage log file sizes.

Help
For usage instructions, run:

bash
Copy code
./devopsfetch.sh -h
Contributing
Feel free to open issues or submit pull requests if you have suggestions or improvements.

License
This project is licensed under the MIT License.

