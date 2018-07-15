pipeline { 
    agent any 
    stages {
        stage('Checkout') { 
            steps { 
                sh 'echo checking-out' 
                checkout scm
            }
        }
        stage('Build') { 
            steps { 
                sh 'echo building war file' 
		sh 'mvn clean package -U'
            }
        }
	stage('Back-end') {
            agent {
                docker { image 'maven:3-alpine' }
            }
            steps {
                sh 'mvn --version'
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
