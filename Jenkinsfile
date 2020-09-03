pipeline {
	agent any
	stages {
		stage ('Build') {
			steps {
				sh ' echo "Hello flask!"'
				sh ' ls -lrt'
			}
		}
		stage ('Lint'){
			steps{
				sh '''
					./hadolint Dockerfile'
					make lint
				'''
			}
		}

}
