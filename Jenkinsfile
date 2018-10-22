pipeline {
    agent any
    triggers {
         pollSCM('* * * * *') // Polling Source Control
     }

     tools {
        maven 'Maven'
    }

    stages{
        stage('Build'){
            steps{
                 build job: 'miniproject-build'
            }
        }

        stage('Dockerize miniproject'){
            steps{
                build job: 'miniproject-docker'
            }
        }

        stage('Deploy to QA'){
            steps{
                build job: 'deploy-to-qa'
            }
        }

        stage('Deploy to Prod'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message:'Approve PRODUCTION Deployment?'
                }
                build job: 'deploy-to-prod'
            }
        }
    } 

}

