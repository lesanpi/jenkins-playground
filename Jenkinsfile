// node {

//    stage('Checkout') {
//         steps {
//             checkout scm
//         }
//     }

//    stage('List folder') {
//         steps {
//             sh 'ls -l'
//         }
//     }
        
//    stage('test') {
//      nodejs(nodeJSInstallationName: 'nodejs') {
//        sh 'npm install --only=dev'
//        sh 'npm test'
//      }
//    }
 
// }

node {
   def gitcommit
   stage('Verificacion SCM') {
     checkout scm
     sh "git rev-parse --short HEAD > .git/commit-id"
     gitcommit = readFile('.git/commit-id').trim()
   }
   stage('test') {
     def contenedortest = docker.image('node:4.6')
     contenedortest.pull()
     contenedortest.inside {
       sh 'npm install --only=dev'
       sh 'npm test'
     }
   }                   
}