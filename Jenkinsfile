pipeline{
    agent any
    tools{
         maven 'maven3.6'
    }
    stages{
        stage('checkout scm'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git_cred', url: 'https://github.com/Kirantubakad/heloapp.git']]])
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
            post{
                success{
                    echo "Archiving the artifacts"
                    archiveArtifacts artifacts: '**/target/*.war', followSymlinks: false
                }
            }
        }
        stage('test'){
            steps{
                   echo "Quality analysis by using sonarqube"
                    sh 'sleep 2'
            }
        }
        stage('deploy'){
            steps{
                echo "deploying to tomcat"
               
            }
            post{
                success{
                   deploy adapters: [tomcat9(credentialsId: 'tomcatcredential', path: '', url: 'http://52.14.51.131:8090/')], contextPath: null, war: '**/*.war'
                }
            }
        }
    }
 }    
