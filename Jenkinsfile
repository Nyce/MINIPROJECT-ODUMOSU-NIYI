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
                sh 'mvn clean install'
            }
            post {
                success {
                    echo "Now archiving...."
                    archiveArtifacts artifacts: '**/build/libs/*.jar, **/target/*.jar'

                }  
   
            }
        }
        /*stage('QualityCheck'){
            steps{
                build job: 'mini-project-code-quality'
            }

            post {
                success {
                    echo "Now archiving...."
                    archiveArtifacts artifacts: '**/build/libs/*.jar, **/target/*.jar'

                }  
            }
        }*/

        stage('Dockerize miniproject'){
            steps{
                build job: 'miniproject-dockerize'
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

