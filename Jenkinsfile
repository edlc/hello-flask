pipeline {
	agent any
	stages {
		stage ('Build') {
			steps {
				sh '''
					 make install
					 ./run_docker.sh 
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
				sh '''
				   kubectl apply -f kubernetes/hello-flask-deployment.yaml
				   kubectl apply -f kubernetes/hello-flask-service.yaml
				'''
		      }
		}
	}
}
