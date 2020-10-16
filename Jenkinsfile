pipeline {
	environment {
		registry = "https://registry.hub.docker.com" 
		registryCredential = 'dockerhub' 
		dockerImage = '' 
	}
	agent any
	stages {
		stage ('Build') {
			steps {
			      script {
			       	    //  docker.withRegistry('', registryCredential) {
			   	       dockerImage= docker.build("hello-flask:$BUILD_NUMBER")
				     }
					// sh './run_docker.sh'
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
						kubectl kubernetes/hello-flask-deployment.yaml
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
		/*stage ('create kube config file') {
		      steps {
		      	    withAWS(region: 'ap-southeast-2', credentials: 'jenkins-master'){
			    		    sh '''
					       aws eks --region ap-southeast-2 update-kubeconfig --name eksCluster
					       '''
					       
			     }

		       }
	 	 }*/
	}
}
