pipeline{
    agent any
    stages{
        stage('checkout scm'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git_cred', url: 'https://github.com/Kirantubakad/heloapp.git']]])
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('deploy'){
            steps{
                echo "deploying to tomcat"
                archiveArtifacts artifacts: '*/.war', followSymlinks: false, onlyIfSuccessful: true
            }
            post{
                success{
                   deploy adapters: [tomcat9(credentialsId: 'tom_credential', path: '', url: 'http://43.206.121.199:8090')], contextPath: null, war: '**/*.war'
                }
            }
        }
    }
 }    
