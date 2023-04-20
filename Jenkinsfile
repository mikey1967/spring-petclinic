pipeline {
    agent any
    stages{
        stage('git url' ){
            steps {
                git url: 'https://github.com/mikey1967/spring-petclinic.git', branch: 'main'
            }
        }

        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Sonarqube'){
            withSonarQubeEnv('My SonarQube Server') {
                sh 'mvn package sonar:sonar'
              }
        }
    }
}
