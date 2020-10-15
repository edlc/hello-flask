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
		      withKubeConfig([credentialsId: 'kubeconfig', serverUrl: 'https://BB1B07604EC6D9AAB16ABB56758FC456.gr7.ap-southeast-2.eks.amazonaws.com']) {
		      		sh 'kubectl get svc'
		      }
		}
	}
}
