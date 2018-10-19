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
   
        }
        stage('QualityCheck'){
            steps{
                build job: 'mini-project-code-quality'
            }

            post {
                success {
                    echo "Now archiving...."
                    archiveArtifacts artifacts: '**/build/libs/*.jar, **/target/*.jar'

                }  
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
        /*
        stage('QA-Deployment'){
            steps{
                sh 'scp -i /Users/niyiodumosu/workspaces/MINIPROJECT-ODUMOSU-NIYI/miniproject-key.pem target/*.jar ec2-user@ec2-54-90-243-96.compute-1.amazonaws.com:~'
                sh 'ssh -i /Users/niyiodumosu/workspaces/MINIPROJECT-ODUMOSU-NIYI/miniproject-key.pem  ec2-user@ec2-54-90-243-96.compute-1.amazonaws.com "java -jar miniproject-odumosu-niyi-0.1.0.jar;"'
                
            }
        }

        stage ('Prod-Deployment'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message:'Approve PRODUCTION Deployment?'
                }

                sh 'scp -i /Users/niyiodumosu/workspaces/MINIPROJECT-ODUMOSU-NIYI/miniproject-key.pem target/*.jar ec2-user@ec2-54-89-173-143.compute-1.amazonaws.com:~'
                sh 'ssh -i /Users/niyiodumosu/workspaces/MINIPROJECT-ODUMOSU-NIYI/miniproject-key.pem  ec2-user@ec2-54-89-173-143.compute-1.amazonaws.com "java -jar miniproject-odumosu-niyi-0.1.0.jar;"'
                
            }
            post {
                success {
                    echo 'Code deployed to Production.'
                }

                failure {
                    echo ' Deployment failed.'
                }
            }
        }*/
    
    }
  }
}


