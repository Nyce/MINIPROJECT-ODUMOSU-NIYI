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
                    archiveArtifacts artifacts: '**/build/libs/*.jar, **/target/*.jar'
                }  
            }
   
        }
    }
}