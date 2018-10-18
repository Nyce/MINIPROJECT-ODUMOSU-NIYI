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
    
    }
}