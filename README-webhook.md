Jenkins GitHub Webhook Integration
Project Overview

This project demonstrates how to integrate GitHub Webhooks with Jenkins Freestyle Projects to trigger automated builds whenever code changes are pushed to a GitHub repository.

Instead of periodically checking the GitHub repository using Poll SCM, Jenkins receives an event notification directly from GitHub.

Technologies Used

Jenkins
Git
GitHub
GitHub Webhooks
Linux
Bash Shell Scripting
Project Details


Component	Configuration
Jenkins Job	gitjob
Job Type	Freestyle Project
Source Code Management	Git
Git Branch	main
Trigger Mechanism	GitHub Webhook
Webhook Event	Push
Build Step	Execute Shell
GitHub Webhook Configuration

Configure the webhook under:

GitHub Repository → Settings → Webhooks → Add Webhook

Webhook Settings

Payload URL: http://16.171.242.161:8080/github-webhook/
Content Type: application/json
Event: Just the push event
Active: Enabled
Note: The HTTP endpoint is used for this learning environment. HTTPS with a valid TLS certificate is recommended for production.

Jenkins Job Configuration

Open Jenkins Dashboard.
Select the gitjob Freestyle Project.
Click Configure.
Configure Git under Source Code Management.
Enter the GitHub repository URL.
Configure the branch as */main.
Navigate to Build Triggers.
Enable GitHub hook trigger for GITScm polling.
Disable Poll SCM.
Under Build Steps, select Execute Shell.
Execute Shell Command


bash
echo "================================"
echo "JENKINS GITHUB WEBHOOK TEST"
echo "================================"

echo "Build Started At: $(date)"
echo "Git Branch: $GIT_BRANCH"
echo "Build Number: $BUILD_NUMBER"
echo "Job Name: $JOB_NAME"

echo ""
echo "Running Linux System Information"

bash system_info.sh

echo ""
echo "Build Completed At: $(date)"
echo "================================"
Webhook Workflow

Developer modifies the source code.
Developer commits and pushes changes to GitHub.
GitHub sends a push event notification to Jenkins.
Jenkins receives the webhook notification.
Jenkins checks the Git repository for changes.
Jenkins automatically triggers the Freestyle build.
Jenkins executes the shell script.
Build output is available in Console Output.
Testing the Webhook

Make a small change to system_info.sh.
Commit and push the changes to GitHub.
Open Jenkins Dashboard.
Check the gitjob build history.
Open the latest build.
Verify the Console Output.
Verifying Webhook Delivery

Navigate to:

GitHub Repository → Settings → Webhooks → Recent Deliveries

Verify the push event delivery and HTTP response.

A successful HTTP 200 response indicates that the webhook endpoint responded successfully. Also verify that Jenkins actually triggered the expected build.

Poll SCM vs GitHub Webhook


Feature	Poll SCM	GitHub Webhook
Trigger Method	Periodic checking	Event notification
Build Trigger	Scheduled	Push event
GitHub Communication	Jenkins checks GitHub	GitHub contacts Jenkins
Build Delay	Depends on polling interval	Usually near-immediate
Configuration	Cron expression	Webhook endpoint
Learning Outcomes

Understanding GitHub Webhooks.
Integrating GitHub with Jenkins.
Configuring Jenkins Freestyle Projects.
Automating builds using push events.
Understanding webhook delivery and troubleshooting.
Comparing Poll SCM with webhook-based triggers.
Conclusion

Successfully integrated GitHub Webhooks with Jenkins Freestyle Projects to automate build execution whenever changes are pushed to the configured GitHub repository.

This project is part of my Jenkins and CI/CD learning journey.
