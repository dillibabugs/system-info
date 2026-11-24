Jenkins GitHub Webhook Integration
A beginner-friendly project demonstrating automated Jenkins builds using GitHub Webhooks and Freestyle Projects.

1. Project Overview

This project integrates GitHub Webhooks with Jenkins to automatically trigger builds whenever code changes are pushed to a GitHub repository.

Unlike Poll SCM, which periodically checks for changes, webhooks notify Jenkins when a GitHub push event occurs.

2. Technologies Used

Jenkins
Git
GitHub
GitHub Webhooks
Linux
Bash Shell Scripting
3. Project Architecture


text
Developer
    |
    | Git Push
    v
GitHub Repository
    |
    | Push Event
    v
GitHub Webhook
    |
    | HTTP POST
    v
Jenkins Server
    |
    | Trigger Build
    v
Freestyle Project
    |
    | Execute Shell
    v
system_info.sh
    |
    v
Jenkins Console Output
4. GitHub Webhook Configuration

Navigate to:

GitHub Repository → Settings → Webhooks → Add Webhook

Configure the following settings:


Setting	Value
Payload URL	http://16.171.242.161:8080/github-webhook/
Content Type	application/json
Secret	Optional for initial testing
Events	Just the push event
Active	Enabled
Note: HTTP is used in this learning environment. HTTPS with a valid TLS certificate is recommended for production.

5. Jenkins Freestyle Job Configuration

Job Name: gitjob

Navigate to:

Jenkins Dashboard → gitjob → Configure

Source Code Management


Setting	Value
SCM	Git
Repository	Your GitHub repository URL
Branch	*/main
Build Triggers

Enable:

GitHub hook trigger for GITScm polling
Disable:

Poll SCM
Build Steps

Select:

Add Build Step → Execute Shell

Add the following commands:


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
Save the Jenkins configuration.

6. Webhook Execution Workflow

Developer modifies the source code.
Changes are committed and pushed to GitHub.
GitHub sends a push event notification.
Jenkins receives the webhook request.
Jenkins checks the configured Git repository for changes.
Jenkins triggers the Freestyle build.
Jenkins executes system_info.sh.
Build results appear in Console Output.
7. Testing the Webhook

Follow these steps to test the integration:

Open your GitHub repository.
Modify system_info.sh.
Commit and push the changes to the configured branch.
Open Jenkins Dashboard.
Navigate to the gitjob project.
Check Build History.
Open the latest build.
Verify the Console Output.
8. Verify Webhook Delivery

Navigate to:

GitHub Repository → Settings → Webhooks → Recent Deliveries

Verify the following:

Event type: push
HTTP response: 200
Delivery status: Successful
A successful HTTP response confirms that the endpoint responded. Also verify that Jenkins actually triggered the expected build.

9. Poll SCM vs GitHub Webhook


Feature	Poll SCM	GitHub Webhook
Trigger method	Periodic checking	Event notification
Communication	Jenkins checks GitHub	GitHub contacts Jenkins
Build delay	Depends on polling interval	Usually near-immediate
Configuration	Cron schedule	Webhook endpoint
Efficiency	Repeated checks	Event-driven
10. Learning Outcomes

Through this project, I learned:

GitHub and Jenkins integration.
GitHub Webhook configuration.
Jenkins Freestyle Project configuration.
Automated build triggering.
Webhook delivery verification.
Difference between Poll SCM and Webhooks.
Basic CI automation concepts.
11. Conclusion

Successfully configured GitHub Webhooks with a Jenkins Freestyle Project to automate build execution whenever changes are pushed to the configured GitHub branch.

This project is part of my hands-on Jenkins and CI/CD learning journey.

Project: Jenkins Linux System Information

Integration: GitHub Webhooks

Build Type: Jenkins Freestyle Project
