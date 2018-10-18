pipeline {
    agent any
    triggers {
         pollSCM('* * * * *') // Polling Source Control
     }

stages{
    stage('Build'){
        steps{
            sh 'mvn clean package'
        }
        post {
            success {
                echo "Now archiving...."
                archiveArtifacts artifats: '**/build/libs/*.jar, **/target/*.jar'
            }
        }
        
        }

   
    }
}