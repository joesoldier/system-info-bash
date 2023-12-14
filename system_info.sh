#!/bin/bash



# file where the system information is stored
output_file="system_info.txt"


# Set of scripts that gather system information
{


# Display system hostname
echo "System Hostname:"
hostname


# Display's the operating system informtaion
echo -e "\nOperating System:"
cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2 | cut -d'"' -f2



# Displays sytem uptime
echo -e "\nUptime:"
uptime -p


# Displays Linux Kernel Version
echo -e "\nLinux Kernel Version:"
uname -a | awk '{print $3}'


# Displays CPU informtaion
echo -e "\nCPU Information:"
lscpu | grep "Model name:"


# Displays memory information
echo -e "\nMemory Informtaion:"
free -h


# Displays IP informtaion
echo -e "\nIP Information:"
ip addr show


# Displays File system information
echo -e "\nFilesystem Utilization:"
df -h


# Displays the last five lines of logs containing 'error' (case- insesitive)
echo -e "nLast five lines of logs containing 'error'(case-insensitive):"
grep -i "error" /var/log/syslog | tail -n 5



} > "$output_file" # Redirects the output to the 'system_info.txt' file


# Informs the user that the system infoprmtaion has been saved
echo "System information has been gathered and saved to $output_file"
