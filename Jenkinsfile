pipeline {
	agent any
	stages {
		stage ('Deploy - Production'){
		      steps{
				sh '''
					kubectl -n hello-flask set image deployment hello-flask-deployment hello-flask=cardene/hello-flask:1.0
				'''
		      }
		}
	}
}
