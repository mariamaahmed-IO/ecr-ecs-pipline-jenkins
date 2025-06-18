pipline {
    agent any

    stages {
        stage('clone') {
            steps {
                sh 'echo "Cloning repository..."'
                // Add your clone commands here
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                // Add your test commands here
            }
        }
        stage('creatingfile') {
            steps {
                sh 'touch text -$BUILD_ID'
                // Add your deployment commands here
            }
        }
    }
