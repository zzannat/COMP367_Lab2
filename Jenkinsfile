pipeline {
    agent any

    tools {
        // Install the Maven version configured as "MAVEN3" and add it to the path.
        maven "MAVEN3"
    }
    environment{
        DOCKERHUB_USER = 'zzannat'
    }

    stages {
        stage('Check out') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url:  'https://github.com/zzannat/COMP367_Lab2.git'
            }
        }
        
        stage('Build Maven Project') {
            steps {
                // Build Maven project
                bat "mvn clean install"
            }
        }
        stage('Unit test'){
            steps{
                bat "mvn test"
            }
        }
        stage('Jacoco: Report'){
            steps{
                
                 jacoco(execPattern: '**/target/*.exec')
            }
        }
        stage('Docker Build'){
            steps{
                script{
                    bat "docker build -t my_maven_webapp_image ."
                }
            }
        }
        stage('Docker Login'){
            steps{
                //Login to Docker Hub
                script{
                    withCredentials([usernamePassword(credentialsId: 'CredentialID_DockerHub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PWD')]) {
                        bat "echo ${DOCKERHUB_PWD} | docker login -u ${DOCKERHUB_USER} --password-stdin"
                    }
                }
            }
        }
        stage('Docker Push'){
            steps{
                //push docker image to docker hub
                bat "docker push zzannat/my_maven_webapp_image"
            }
        }
    }    
}
