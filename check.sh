#!/bin/bash

cat '/home/ec2-user/.zsh_history' > commands_history.txt

##
# BASH script that checks:
# - Memory usage
# - CPU load
# - Number of TCP connections
# - Kernel version
##
server_name=$(hostname)
function memory_check() {
 echo "" > server_check.txt
 echo "Memory usage on ${server_name} is: " >> server_check.txt
 free -h >> server_check.txt
 echo "" >> server_check.txt
}
function cpu_check() {
 echo "" >>server_check.txt
 echo "CPU load on ${server_name} is: " >> server_check.txt
 echo "" >> server_check.txt
 uptime >> server_check.txt
 echo "" >> server_check.txt
}
function tcp_check() {
 echo "" >> server_check.txt
 echo "TCP connections on ${server_name}: " >> server_check.txt
 echo "" >> server_check.txt
 cat /proc/net/tcp | wc -l >> server_check.txt
 echo "" >> server_check.txt
}
function kernel_check() {
 echo "" >> server_check.txt
 echo "Kernel version on ${server_name} is: " >> server_check.txt
 echo "" >> server_check.txt
  uname -r >> server_check.txt
 echo "" >> server_check.txt
}
function all_checks() {
 memory_check
 cpu_check
 tcp_check
 kernel_check
}
all_checks

git add .
git commit -m "Info on $(date +%s%N)"
git push
