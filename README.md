# MINIPROJECT-ODUMOSU-NIYI

## Continuous Integration/Continuos Delivery Pipeline presented by Niyi Odumosu

### What is CI/CD anyway?

CI/CD is an acronym for Continuous Integration Continuous Delivery. It is a powerful methodology of software and infrastruture development that enables engineers to develop code, commit it, and push it to a repository that triggers a delivery pipeline. 

### Why use CI/CD? 
CICD drastically increases the speed of delivering software product features that allow engineers, stakeholders, and customers alike to receive proven quality-tested results. With CICD, engineers can build and ship code to production environments in small bite size deliverables. Instead of using traditional methods that require engineers and business associates to coordinate long tiring production deployments.

### Miniproject-Odumosu-Niyi

This repository uses infrastructure as code to provision ec2 instances as well as to define a code quality tested delivery pipeline. The pipeline gets triggered by pushes to the github repository and begins to build, test and deploy the code in different environments.

Tech Stack:
 - AWS CloudFormation
 - Jenkins
 - Spring Boot
 - Docker Containers
 - Checkstyle
 - SonarQube
 - Groovy Pipeline Script
 - AWS infrastructure

### Prerequisites
There are certain technologies that you will need to have on your personal machine in order to run this application.
They include the following:
- Java 8 
- Apache Maven
- Gradle 
- Docker

## Let's get started!

1. Start your delivery journey by forking a repo off this base branch `https://github.com/Nyce/MINIPROJECT-ODUMOSU-NIYI/` 
2. Once you forked a repository, clone it on to your personal machine. `git clone git@github.com:<your-github-name>/MINIPROJECT-ODUMOSU-NIYI/`
3. Go to the newly cloned directory `cd MINIPROJECT-ODUMOSU-NIYI`
4. Now it's time to clean and build the project. You can do this by running the following `mvn clean package` & `mvn clean install`
5. Make a small change. Go to `src/main/hello/Application.java` and open the file in a text editor of your choosing.
6. On line 27 of the file in the `automoate.setMessage()` method, change the string to whatever you like. Then when you are finished commit and push the changes to your forked branch.
 - Don't know how to commit and push changes? No problem. Run the following commands in the root directory of the project.
 -`git commit -a -m "First code change"`
 - `git push orgin <your branch>`
 
 7. Once you've pushed your change, submit a Git pull request to the base branch (the repository and branch you forked your project from)
 8. Once I have approved your changes, you can see where the real fun starts!
 
 ## C-I-C-Your way into this delivery pipeline
Now that the changes have been pushed to this repo's master branch, you can see all the cool stuff going on behind the scenes!

1. Go to http://ec2-35-173-247-136.compute-1.amazonaws.com:8080 to visit the jenkins server that hosts our delivery pipeline. 
2. You can login with these credentials UN: `user` PW: `jenkins`
3. Once you login, you should see multiple build jobs in the jenkins dashboard. Click on `miniproject-pipeline`
4. Here you should see that the miniproject-pipeline kicks off multiple build jobs for the miniproject. More than likely you see one of the jobs in the pipeline building.

Now let's break down each build job in the miniproject pipeline!

- 

