pipeline {
	environment {
		registry = "https://registry.hub.docker.com" 
		registryWithoutProtocol="registry.hub.docker.com"
		registryCredential = 'dockerhub' 
		accountName = 'cardene'
		dockerImage = '' 
		appName = 'hello-flask'
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
		stage ('Lint'){
			steps{
				sh '''
					./hadolint Dockerfile		
					make lint
				'''
			}
		}
		stage ('Build') {
			steps {
			      script {
			   	       dockerImage= docker.build("$accountName/$appName:$BUILD_NUMBER")
				     }
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
					sh './run_kubernetes.sh $appName'
		     	 }
			}
		}
		stage ('Cleanup'){
		      steps {
		      	    sh 'docker image rm $accountName/$appName:$BUILD_NUMBER'
					sh 'docker image rm $registryWithoutProtocol/$accountName/$appName:$BUILD_NUMBER'
		      }
		}
	}
}
