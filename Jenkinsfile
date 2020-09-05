pipeline {
	agent any
	stages {
		stage ('Build') {
			steps {
				sh ' make install'
				sh ' ls -lrt'
			}
		}
		stage ('Lint'){
			steps{
				sh '''
					./hadolint Dockerfile		
					make lint
				'''
			}
		}
	}
}
