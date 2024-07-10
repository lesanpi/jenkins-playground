node {
   def gitcommit
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
        
   stage('test') {
     nodejs(nodeJSInstallationName: 'nodejs') {
       sh 'npm install --only=dev'
       sh 'npm test'
     }
   }
   stage('Docker Build & Push') {
     docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
      def nuestraapp = docker.build("macloujulian/nodejsapp:${gitcommit}", ".")
      nuestraapp.push()
     }
   }
}