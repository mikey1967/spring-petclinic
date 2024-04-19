pipeline {
    agent any
    stages{
        stage('clone') {
            steps {
                git url: 'https://github.com/mikey1967/spring-petclinic.git', branch: 'main'
            }
        }
        stage('build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('archiveartifacts'){
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            junit '**/surefire-reports/*.xml'
            }
        }
    }
}
