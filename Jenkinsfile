pipeline {
    agent any
    stages{
        stage('git url' ){
            steps {
                git branch 'main', url 'https://github.com/mikey1967/spring-petclinic.git'
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
