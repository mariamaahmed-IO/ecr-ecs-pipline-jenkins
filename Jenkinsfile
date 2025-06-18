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
        stage('Dockerlogin') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin \
                173036476311.dkr.ecr.us-east-1.amazonaws.com'
            
            }
        }
        stage('DockerImagebuild') {
            steps {
                sh 'docker build -t webapp-repo .'
                // Add your test commands here
            }
        }
        stage('Dockertag') {
            steps {
                sh 'docker tag webapp-repo:latest \
                173036476311.dkr.ecr.us-east-1.amazonaws.com/webapp-repo:latest'
                 sh 'docker tag webapp-repo:latest \
                173036476311.dkr.ecr.us-east-1.amazonaws.com/webapp-repo:v1.$BUILD_NUMBER'
            }
        }
        stage('pushImage') {
            steps {
                sh 'docker push 173036476311.dkr.ecr.us-east-1.amazonaws.com/webapp-repo:latest'
                sh 'docker push 173036476311.dkr.ecr.us-east-1.amazonaws.com/webapp-repo:v1.$BUILD_NUMBER'
                sh 'docker ps'
                // Add your deployment commands here
            }
        }
    }
}