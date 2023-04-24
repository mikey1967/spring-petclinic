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
              withSonarQubeEnv('sonarqube_server') {
                sh 'mvn clean package sonar:sonar'
              }
            }
        }

        stage ('artifactory'){
            steps{
                rtMavenDeployer (
                    id: 'MAVEN_DEPLOYER',
                    serverId: 'JFROG_JENKINS',
                    releaseRepo: 'libs-release-local',
                    snapshotRepo: 'libs-snapshot-local'
                )
            }
        }

        stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: 'MAVEN_DEFAULT', // Tool name from Jenkins configuration
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: "MAVEN_DEPLOYER"
                )
            }
        }

        stage('publish artifacts to docker'){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'docker_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ubuntu', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/*.jar'), sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home/ubuntu', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }

        stage('docker build'){
            steps{
                sshagent(['docker']) {
                  sh 'ssh ubuntu@172.31.81.130 docker image build -t mikey:1.1 .'
                  sh 'ssh ubuntu@172.31.81.130 docker image tag mikey:1.1 mike8309/mikey:1.1'
                  sh 'ssh ubuntu@172.31.81.130 docker image push mike8309/mikey:1.1' 
               }
            }
        }

        stage('deploy to k8s'){
            steps{
                sshagent(['k8s']) {
                  sh 'scp -r -o StrictHostKeyChecking=no deployment.yaml ubuntu@172.31.30.108:/home/ubuntu'
                  sh 'ssh ubuntu@172.31.30.108 ./kubectl apply -f /home/ubuntu/deployment.yaml --kubeconfig=/home/ubuntu/.kube/config'
               }
            }
        }
    }
}
