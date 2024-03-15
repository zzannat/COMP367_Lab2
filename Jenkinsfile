pipeline {
    agent any

    tools {
        // Install the Maven version configured as "MAVEN3" and add it to the path.
        maven "MAVEN3"
    }
    environment{
        DOCKERHUB_PWD=credentials('CredentialID_DockerHubPWD')
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
                sh 'mvn clean install'
            }
        }
        stage('Unit test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Jacoco: Report'){
            steps{
                sh 'mvn clean verify jacoco:report'
                
                 jacoco(execPattern: '**/target/*.exec')
            }
        }
        stage('Docker Build'){
            steps{
                script{
                    sh 'docker build -t my_maven_webapp_image .'
                }
            }
        }
        stage('Docker Login'){
            steps{
                //Login to Docker Hub
                script{
                    sh "docker login -u zzannat -p '${DOCKERHUB_PWD}'"
                }
            }
        }
        stage('Docker Push'){
            steps{
                //push docker image to docker hub
                sh 'docker push zzannat/my_maven_webapp_image'
            }
        }
    }    
}
