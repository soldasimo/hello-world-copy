pipeline { 
    agent any 
    stages {
        stage('Checkout') { 
            steps { 
                sh 'echo checking-out' 
            }
        }
        stage('Build') { 
            steps { 
                sh 'echo building' 
            }
        }
        stage('Test'){
            steps {
                sh 'echo testing'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploying'
            }
        }
    }
}