pipeline {
    agent any
    parameters{
        string(name: 'TEST', defaultValue: 'mikey', description: 'Waste fellow')
    }
    tools {
        maven 'MAVEN'
        jdk 'java'
    }
    triggers { pollSCM('* * * * *') }
    stages {
        stage('clone the url'){
            steps {
                git url: 'https://github.com/mikey1967/spring-petclinic.git', branch: 'main'
            }
        }

        stage('build'){
            steps {
                sh 'mvn package'
            }
        }

        stage ('testing paramater'){
            steps{
                echo "${params.TEST}"
            }
        }
    }
}

