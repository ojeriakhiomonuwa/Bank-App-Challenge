// pipeline {
//     agent {
//         docker {
//             image 'node:18.20'
//         }
//     }
    
//     environment {
//         NODE_ENV = 'development'
//         HOME = "$env.WORKSPACE"
//     }

//     stages {
//         stage('Checkout GitHub Repository'){
//             steps{
//                 // Checkout code from the GitHub Repository
//                 git url: 'https://github.com/lateef-taiwo/Bank-App-Challenge.git', branch: 'main'

//             }
//         }
//         // stage('Install Node and NPM'){
//         //     steps{
//         //         // install node if its not present already
//         //         //sh 'sudo apt update -y'
//         //         sh 'sudo apt install nodejs npm -y'
                
//         //     }
//         // }
//         stage('Install npm'){
//             steps{
//                 // Install Depencies
//             sh 'npm install'
//         }
//         }
//         // stage ('Run the Application in Development mode'){
//         //     steps{
//         //         // Start the Development serve
//         //         sh 'npm start'
//         //     }
//         // }

//         stage ('Run Build'){
//             steps{
//                 // Start the Development serve
//                 sh 'npm run build --verbose'
//             }
//         }
//     }
//     post {
//         always {
//             cleanWs()
//         }
//         success {
//             echo 'Build and tests was Successful'
//         }
//         failure {
//             echo ' Build failed'
//         }
//     }
// }


pipeline {
    agent any

    environment {
        NODE_ENV = 'development'
        HOME = "${env.WORKSPACE}"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/lateef-taiwo/Bank-App-Challenge.git', branch: 'main'
            }
        }
        stage('Install Node.js') {
            steps {
                sh '''
                    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
                    nvm install 14
                '''
            }
        }
        stage('Install Dependencies') {
            steps {
                sh '''
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
                    nvm use 14
                    npm install
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
                    nvm use 14
                    npm test
                '''
            }
        }
        stage('Build') {
            steps {
                sh '''
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
                    nvm use 14
                    npm run build --verbose
                '''
            }
        }
        stage('Start Development Server') {
            steps {
                sh '''
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
                    nvm use 14
                    npm start
                '''
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        success {
            echo 'Build and tests were successful!'
        }
        failure {
            echo 'Build or tests failed!'
        }
    }
}
