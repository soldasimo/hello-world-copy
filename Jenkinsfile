pipeline { 
    agent any 
    stages {
        stage('Checkout') { 
            steps { 
                sh 'echo checking-out' 
                checkout scm
            }
        }
	stage ('Determine Branch Version') {
		// add maven to path
		withEnv(["MAVEN_HOME=/usr/local/bin"]){
			// determine version in pom.xml
			branchVersion = sh(script: 'mvn -q -Dexec.executable=\'echo\' -Dexec.args=\'${project.version}\' --non-recursive exec:exec', returnStdout: true).trim()
			echo "$branchVersion"
			// compute proper branch SNAPSHOT version
			//pomVersion = pomVersion.replaceAll(/-SNAPSHOT/, "") 
			//branchVersion = env.BRANCH_NAME
			// echo "$branchVersion"
			//branchVersion = branchVersion.replaceAll(/origin\//, "") 
			// branchVersion = branchVersion.replaceAll(/\W/, "-")
			// branchVersion = "${pomVersion}-${branchVersion}-SNAPSHOT"

			// set branch SNAPSHOT version in pom.xml
			sh "mvn versions:set -DnewVersion=${branchVersion}"
		}
	}
        stage('Build') { 
            steps { 
                sh 'echo building war file' 
		sh 'mvn clean package -U'
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
