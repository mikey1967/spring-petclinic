pipeline {
    agent 
    parameters{
        choice (name: 'mikey1', choices: ['main','mikey','akhil','jyo'], description: '')
    }
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
    }
}