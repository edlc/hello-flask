pipeline {
	environment {
		registry = "https://registry.hub.docker.com" 
		registryCredential = 'dockerhub' 
		dockerImage = '' 
	}
	agent any
	stages {
		stage ('create kube config file') {
		      steps {
		      	    withAWS(region: 'ap-southeast-2', credentials: 'jenkins-master'){
			    		sh '''
					       aws eks --region ap-southeast-2 update-kubeconfig --name eksCluster
					    '''
			     }

		       }
	 	 }
		stage ('Build') {
			steps {
			      script {
			   	       dockerImage= docker.build("cardene/hello-flask:$BUILD_NUMBER")
				     }
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
				script {
					docker.withRegistry(registry, registryCredential) {
						dockerImage.push('latest')
						dockerImage.push('$BUILD_NUMBER')
					}
				}
			}
		}
		stage ('Deploy'){
		     steps {
				 withAWS(region: 'ap-southeast-2', credentials: 'jenkins-master') {
					sh '''
						./kubernetes/create_namespace hello-flask
						kubectl apply -f kubernetes/hello-flask-deployment.yaml
						kubectl kubernetes/hello-flask-service.yaml
					'''
		     	 }
			}
		}
		stage ('Cleanup'){
		      steps {
		      	    sh 'docker rmi $registry:$BUILD_NUMBER'
		      }
		}
	}
}
