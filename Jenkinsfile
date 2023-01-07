pipeline{
    environment{
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-kiran')
    }
    tools{
         maven 'maven3.6'
    }
    stages{
        stage('checkout scm'){
            steps{
                git credentialsId: 'github_credential', url: 'https://github.com/Kirantubakad/heloapp.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('build image'){
            steps{
                sh ' docker build -t kirankumartubakad/heloapp:helloapp . '
            }
        }
    }
}   
