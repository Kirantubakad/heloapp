pipeline{
    agent none
    environment{
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-kiran')
    }
    tools{
         maven 'maven'
    }
    stages{
        stage('checkout scm'){
            agent {label 'slave1'}
            steps{
                git credentialsId: 'github_credential', url: 'https://github.com/Kirantubakad/heloapp.git'
            }
        }
        stage('build'){
            agent {label 'slave1'}
            steps{
                sh 'mvn clean install'
            }
        }
        stage('build image'){
            agent {label 'slave1'}
            steps{
                sh ' docker build -t kirankumartubakad/heloapp:helloapp . '
            }
        }
    }
}   
