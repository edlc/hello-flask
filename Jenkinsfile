pipeline {
	agent any
	stages {
		stage ('Build') {
			steps {
				sh '''
					 make install 
					 ./run_docker
					
				'''
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
		stage ('Upload Docker Image'){
			steps{
				sh ' ./upload_docker.sh'
			}
		}
		stage ('Deploy'){
		      steps{
				sh ' ./deploy.sh'
		      }
		}
	}
}
