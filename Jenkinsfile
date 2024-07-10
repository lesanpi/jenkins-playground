pipeline {
    

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
            agent {
                docker {
                    image 'node:20-alpine'
                }
            }
        
            steps {
                echo "Branch is ${env.BRANCH_NAME}..."
                
                withNPM(npmrcConfig:'my-custom-npmrc') {
                    echo "Performing npm build..."
                    sh 'npm install'
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
