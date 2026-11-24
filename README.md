
# Jenkins Linux Server System Information

## Project Overview

This is my first Jenkins Freestyle Project.

The purpose of this project is to collect and display
Linux system information using a simple Bash script.

Jenkins fetches the source code from GitHub and
executes the script automatically using Poll SCM.

## Project Structure

system-info/
|
|-- system_info.sh
|-- README.md
|-- .gitignore

## Information Collected

The script displays the following information:

### System Information
- Current date and time
- Logged-in user
- Hostname
- Operating system version
- Kernel version
- System architecture
- Shell information

### CPU Information
- Number of CPU cores
- CPU model
- CPU usage
- System load average

### Memory Information
- Total RAM
- Used RAM
- Available RAM
- Free RAM
- Memory usage percentage

### Disk Information
- Disk partitions
- Total disk space
- Used disk space
- Available disk space

### Additional Information
- System uptime
- Top 10 CPU-consuming processes
- Network IP address
- Job start time
- Job completion time

## Technologies Used

- Linux
- Bash Shell Scripting
- Git
- GitHub
- Jenkins

## Jenkins Configuration

1. Create a Freestyle Project.
2. Configure Git under Source Code Management.
3. Add the GitHub repository URL.
4. Select the main branch.
5. Enable Poll SCM.
6. Configure the polling schedule.
7. Add Execute Shell under Build Steps.

## Execute Shell Command

bash system_info.sh

## Poll SCM Schedule

* * * * *

This checks the Git repository every minute
for new changes.

## Expected Result

Whenever changes are pushed to GitHub,
Jenkins detects the changes during polling
and triggers a new build.

The system information is displayed in
the Jenkins Console Output.

## Author

My First Jenkins Automation Practice Project.
