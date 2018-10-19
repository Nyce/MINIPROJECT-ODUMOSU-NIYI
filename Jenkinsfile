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
        stage('QA-Deployment'){
            steps{
                sh 'var=$((var+1)) && cd ~/workspaces'
                sh 'tar czf miniproject-$var.tar MINIPROJECT-ODUMOSU-NIYI/'
                sh 'scp -i /Users/niyiodumosu/workspaces/MINIPROJECT-ODUMOSU-NIYI/miniproject-key.pem miniproject-$var.tar ec2-user@35.175.220.249'
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