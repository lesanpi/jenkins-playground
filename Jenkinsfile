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
                nodejs(nodeJSInstallationName: 'Node 20', configId: '<config-file-provider-id>') {
                    sh 'npm config ls'
                }
            }
        }


        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts 'build/*'
            }
        }
    }
}
