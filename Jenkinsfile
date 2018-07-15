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
	stage('Build-container') {
            agent {
	    // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
		    dockerfile {
			filename 'Dockerfile'
			dir '.'
			//label 'my-defined-label'
			//additionalBuildArgs  '--build-arg version=1.0.2'
		    }
            }
            steps {
                sh 'echo building docker container' 
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
