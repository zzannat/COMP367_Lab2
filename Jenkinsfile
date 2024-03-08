pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the main branch
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the Maven project
                echo 'mvn clean install'
            }
        }
    }
}
