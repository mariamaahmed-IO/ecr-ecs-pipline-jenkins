pipeline {
    agent any
    environment {
        // Define environment variables for AWS credentials and Docker credentials
        AWS_DEFAULT_REGION = 'us-east-1'
        ECR_IMAGE_REPOSITORY = '173036476311.dkr.ecr.us-east-1.amazonaws.com/webapp-repo'
        ECR_REPO = '173036476311.dkr.ecr.us-east-1.amazonaws.com'


        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
        DOCKER_CREDENTIALS_ID = credentials('docker_credentials_id')
    }
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
                sh 'aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin \
                $ECR_REPO'
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
                $ECR_IMAGE_REPOSITORY:latest'
                sh 'docker tag webapp-repo:latest \
                $ECR_IMAGE_REPOSITORY:v1.$BUILD_NUMBER'
            }
        }
        stage('pushImage') {
            steps {
                sh 'docker push $ECR_IMAGE_REPOSITORY:latest'
                sh 'docker push $ECR_IMAGE_REPOSITORY:v1.$BUILD_NUMBER'

                // Add your deployment commands here
            }
        }
    }
}