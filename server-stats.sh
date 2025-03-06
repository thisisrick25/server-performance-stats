#!/bin/bash

print_header() {
    echo -e "\n=== $1 ===\n"
}

print_separator() {
    echo "----------------------------------------"
}

# Detect if running under WSL (WSL 1 or WSL 2 include "microsoft" in /proc/version)
if grep -qi "microsoft" /proc/version; then
    IS_WSL=1
    echo "Running under WSL environment."
else
    IS_WSL=0
    echo "Running on native Linux."
fi

# System Information
print_header "System Information:"
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
echo "Kernel Version: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk '{print $(NF-2), $(NF-1), $NF}')"
echo "Logged-in Users: $(users)"
echo "Failed Login Attempts: $(lastb 2>/dev/null | wc -l)"
print_separator

# Total CPU Usage
print_header "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | awk '{print "Total CPU Usage: " $1 "%"}'
print_separator

# Total Memory Usage
print_header "Total Memory Usage:"
free -h | awk '
NR==2{printf "Total: %s\tUsed: %s (%.1f%%)\tFree: %s (%.1f%%)\n", $2, $3, ($3/$2)*100, $4, ($4/$2)*100}'
print_separator

# Total Disk Usage
print_header "Total Disk Usage:"
df -h | awk '$NF=="/"{printf "Total: %.1fG\tUsed: %.1fG (%.1f%%)\tFree: %.1fG (%.1f%%)\n", $2/1024, $3/1024, ($3/$2)*100, $4/1024, ($4/$2)*100}'
print_separator

# Top 5 Processes by CPU Usage
print_header "Top 5 Processes by CPU Usage:"
ps aux | sort -nr -k 3 | head -5 | awk '{print $3 "% CPU - " $11}'
print_separator

# Top 5 Processes by Memory Usage
print_header "Top 5 Processes by Memory Usage:"
ps aux | sort -nr -k 4 | head -5 | awk '{print $4 "% MEM - " $11}'
print_separator