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

    stage('test') {
        sh 'node --version'
    }                   
}