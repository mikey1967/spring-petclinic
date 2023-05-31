pipeline {
    agent any
    stages{
        stage('git url' ){
            agent {label 'MIKEY'}
            steps {
                git url: 'https://github.com/mikey1967/spring-petclinic.git', branch: 'main'
            }
        }

        stage('build') {
            agent {label 'MIKEY'}
            steps {
                sh 'mvn clean install'
            }
        }
    }
