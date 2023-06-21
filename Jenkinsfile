pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/vsankar90/jenkins_docker_kubernetes.git'
            }
        }

        stage('Build Docker Image') {
            steps {
               bat 'docker build -t gitmaventomcat:v1 .'
            }
        }

        stage('Login to Docker Registry') {
            steps {
                	withCredentials([usernamePassword(credentialsId: 'dockerlogin', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                        bat "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                        bat 'docker push shanem/spring-petclinic:latest'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://your-docker-registry', 'dockerlogin') {
                        docker.image('sankarv/gitmaventomcat:v1').push()
                    }
                }
            }
        }

        stage('Deploy with kubectl') {
            steps {
                script {
                    def kubeconfig = readFile('.')
                    sh "echo '$kubeconfig' > kubeconfig.yaml"
                    sh 'kubectl --kubeconfig=kubeconfig.yaml apply -f ./path/to/kubernetes-manifests'
                }
            }
        }
    }
}
