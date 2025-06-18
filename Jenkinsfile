pipeline {
    agent any

    stages {
        stage('CodeScan') {
            steps {
                sh 'trivy fs . -o result.html'
                sh 'cat result.html'
                //code analysis commands
            }
        }
        stage('DockerImagebuild') {
            steps {
                sh 'docker -v'
                // Add your test commands here
            }
        }
        stage('pushImage') {
            steps {
                sh 'touch "text -$BUILD_ID"'
                sh 'docker ps'
                // Add your deployment commands here
            }
        }
    }
}