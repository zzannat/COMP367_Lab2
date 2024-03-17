pipeline {
    agent any

    tools {
        // Install the Maven version configured as "MAVEN3" and add it to the path.
        maven "MAVEN3"
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
                    bat "docker login -u zzannat -p 12345678Rk"
                }
            }
        }
        stage('Docker Push'){
            steps{
                //push docker image to docker hub
                bat "docker push latest"
            }
        }
    }    
}
