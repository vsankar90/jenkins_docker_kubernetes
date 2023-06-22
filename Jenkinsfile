pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                bat 'git clone https://github.com/vsankar90/jenkins_docker_kubernetes.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t sankarv/gitmaventomcat:v1 .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerlogin', usernameVariable: 'dockerHubUser', passwordVariable: 'dockerHubPassword')]) {
                    bat "docker login -u %dockerHubUser% -p %dockerHubPassword%"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push sankarv/gitmaventomcat:v1'
            }
        }

        stage('Apply Kubernetes Manifests') {
                 
            
            steps {
            
               
                   powershell 'kubectl apply -f deployment.yaml '
                   
               
            }
        }
    }
}
