
#!/bin/bash

echo "=================================================="
echo "          JENKINS SYSTEM INFORMATION"
echo "=================================================="

echo ""
echo "=============== SYSTEM DETAILS ==================="

echo "Started Date     : $(date)"
echo "User             : $(whoami)"
echo "Hostname         : $(hostname)"
echo "OS Version       : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Kernel Version   : $(uname -r)"
echo "Architecture     : $(uname -m)"
echo "Shell            : $SHELL"

echo ""
echo "=============== CPU INFORMATION =================="

echo "CPU Cores        : $(nproc)"
echo "CPU Model        : $(awk -F: '/model name/ {print $2; exit}' /proc/cpuinfo | xargs)"
echo "CPU Load Average : $(cat /proc/loadavg)"
echo "CPU Usage        : $(top -bn1 | grep '%Cpu' | head -1)"

echo ""
echo "=============== MEMORY INFORMATION ==============="

TOTAL_MEM=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
AVAILABLE_MEM=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
USED_MEM=$((TOTAL_MEM - AVAILABLE_MEM))
FREE_MEM=$(awk '/MemFree/ {print $2}' /proc/meminfo)

echo "Total Memory     : $((TOTAL_MEM / 1024)) MB"
echo "Used Memory      : $((USED_MEM / 1024)) MB"
echo "Available Memory : $((AVAILABLE_MEM / 1024)) MB"
echo "Free Memory      : $((FREE_MEM / 1024)) MB"

echo "Memory Usage     : $(awk -v used="$USED_MEM" -v total="$TOTAL_MEM" 'BEGIN {printf "%.2f%%", (used/total)*100}')"

echo ""
echo "=============== DISK INFORMATION ================="

df -h

echo ""
echo "=============== SYSTEM UPTIME ===================="

uptime

echo ""
echo "=============== TOP 10 PROCESSES ================="

ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -11

echo ""
echo "=============== NETWORK INFORMATION =============="

hostname -I

echo ""
echo "=============== JOB COMPLETION ==================="

echo "Completed Date   : $(date)"

echo "=================================================="
echo "       SYSTEM INFORMATION JOB COMPLETED"
echo "=================================================="
