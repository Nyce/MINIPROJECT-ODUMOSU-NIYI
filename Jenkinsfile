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
                sh 'mvn clean package'
            }
            post {
                success {
                    echo "Now archiving...."
                    archiveArtifacts artifacts: '**/build/libs/*.jar, **/target/*.jar'
                }  
            }
   
        }
        stage('QualityCheck'){
            steps{
                build job: 'mini-project-code-quality'
            }
        }
        stage('QA-Deployment'){
            steps{
                build job: 'deploy-to-qa'
            }
        }

        stage ('Prod-Deployment'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message:'Approve PRODUCTION Deployment?'
                }

                build job: 'deploy-to-prod'
            }
            post {
                success {
                    echo 'Code deployed to Production.'
                }

                failure {
                    echo ' Deployment failed.'
                }
            }
        }
    
    }
}