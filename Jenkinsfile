pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

         stage('List folder') {
            steps {
                sh 'ls -l'
            }
        }

        stage('Install Dependencies') {
            steps {
                nodejs(nodeJSInstallationName: 'Node-20') {
                    sh 'npm install'
                }
            }
        }

    }
}
