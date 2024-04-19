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

        stage('sonar'){
            steps{
                withSonarQubeEnv('sonarqube_server') {
                sh 'mvn clean package sonar:sonar'
                }
            }
        }

        stage('artifactory') {
            steps {
                rtMavenDeployer (
                    id: 'maven-deployer',
                    serverId: 'JFROG',
                    releaseRepo: mikey-libs-release,
                    snapshotRepo: mikey-libs-snapshot,
                )
            }
        }
        
        stage('Build Maven Project') {
            steps {
                rtMavenRun (
                    tool: 'MAVEN',
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: "maven-deployer"
                )
            }
        }

    }
}
            
