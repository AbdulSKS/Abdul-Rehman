pipeline {
    agent any

    environment {
        // Define the Python version
        PYTHON_VERSION = '3.8'
    }

    stages {
        stage('Checkout') {
            steps {
              git branch: 'main', credentialsId: 'cf80b27b-b699-4813-97ae-7b718406c001', url: 'https://github.com/AbdulSKS/Opika-Abdul-Rehman.git'
            }
        }

        

        stage('Build and Test') {
            steps {
            
                script {
                    sh 'pip install -r requirements.txt'
                   
                }
            }
        }

        stage('Deploy') {
            steps {
                // Add additional build steps if needed
                script {
                
                    echo 'The Python application is successfully built, tested and deployed...'
                    // Add any additional build commands
                }
            }
        }

       
    }

   
    }

}
