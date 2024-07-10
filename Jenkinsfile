node {
    env.NODEJS_HOME = "${tool 'Node 6.x'}"
    // on linux / mac
    env.PATH="${env.NODEJS_HOME}/bin:${env.PATH}"
    // on windows
    env.PATH="${env.NODEJS_HOME};${env.PATH}"
    sh 'npm --version'
}

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
