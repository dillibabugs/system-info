Jenkins GitHub Webhook Integration
A hands-on project demonstrating automated Jenkins builds using GitHub Webhooks and Jenkins Freestyle Projects.

1. Project Overview

This project demonstrates how to integrate GitHub Webhooks with Jenkins to automatically trigger builds whenever code changes are pushed to a GitHub repository.

Instead of periodically checking GitHub using Poll SCM, Jenkins receives notifications directly from GitHub whenever a push event occurs.

2. Technologies Used

Jenkins
Git and GitHub
GitHub Webhooks
Linux
Bash Shell Scripting
3. GitHub Webhook Configuration

Navigate to:

GitHub Repository → Settings → Webhooks → Add Webhook

Configure the following:

Payload URL: http://16.171.242.161:8080/github-webhook/
Content Type: application/json
Secret: Optional for initial testing
Events: Just the push event
Active: Enabled
Note: HTTP is used in this learning environment. HTTPS with a valid TLS certificate is recommended for production.

4. Jenkins Freestyle Project Configuration

Open Jenkins and select the existing gitjob project.

Navigate to:

Dashboard → gitjob → Configure

Source Code Management

Select Git.
Enter your GitHub repository URL.
Configure the branch as */main.
Add credentials if the repository is private.
Build Triggers

Enable:

GitHub hook trigger for GITScm polling
Disable:

Poll SCM
Build Steps

Select:

Add Build Step → Execute Shell

Add the following script:





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
Click Save.








5. Webhook Execution Process

Developer makes changes to the source code.
Changes are committed and pushed to GitHub.
GitHub sends a push event notification to Jenkins.
Jenkins receives the webhook notification.
Jenkins checks the configured Git repository for changes.
Jenkins triggers the Freestyle build.
Jenkins executes the shell script.
Build results are displayed in Console Output.
6. Testing the Webhook

Open your GitHub repository.
Modify the system_info.sh file.
Add a simple comment or make a small change.
Commit and push the changes to the configured branch.
Open Jenkins Dashboard.
Navigate to the gitjob project.
Check Build History.
Open the latest build.
Verify the Console Output.
7. Verify Webhook Delivery

Navigate to:

GitHub Repository → Settings → Webhooks → Recent Deliveries

Verify that:

The event type is push.
The HTTP response is successful (normally 200).
The webhook delivery completed successfully.
Jenkins triggered the expected build.
8. Poll SCM vs GitHub Webhook

Poll SCM

Jenkins periodically checks the Git repository.
Requires a polling schedule.
Build execution depends on the polling interval.
GitHub Webhook

GitHub sends an event notification when code is pushed.
Jenkins receives the notification.
Builds can start without waiting for a polling interval.
9. Learning Outcomes

Through this project, I learned:

GitHub and Jenkins integration.
GitHub Webhook configuration.
Jenkins Freestyle Project configuration.
Automated build triggering.
Webhook delivery verification.
Difference between Poll SCM and Webhooks.
Basic CI automation concepts.
10. Conclusion

Successfully integrated GitHub Webhooks with a Jenkins Freestyle Project to automate build execution whenever changes are pushed to the configured GitHub branch.

This project is part of my hands-on Jenkins and CI/CD learning journey.

Project: Jenkins Linux System Information

Integration: GitHub Webhooks

Build Type: Jenkins Freestyle Project
