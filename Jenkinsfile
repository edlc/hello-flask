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
			       withAWS(region:'ap-southeast-2',credentials:'aws-static') {
					sh '''
			           		ls -lrta
				 		kubectl get svc
		 			'''
				}
		      }
		}
	}
}
