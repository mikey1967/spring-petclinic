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

        stage("build & SonarQube analysis") {
            steps {
              withSonarQubeEnv('My SonarQube Server') {
                sh 'mvn clean package sonar:sonar'
              }
            }
        }

        stage ('artifactory'){
            steps{
                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "jfrog-jenkins",
                    releaseRepo: 'libs-release-local',
                    snapshotRepo: 'libs-snapshot-local'
                )
            }
        }
    }
}
