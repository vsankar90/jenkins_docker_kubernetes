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
                script {
                    docker.withRegistry('https://your-docker-registry', 'dockerlogin') {
                        def customImage = docker.build('sankarv/gitmaventomcat:v1', 'Dockerfile')
                    }
                }
            }
        }

        stage('Login to Docker Registry') {
            steps {
                script {
                    docker.withRegistry('https://your-docker-registry', 'dockerlogin') {
                        docker.login()
                    }
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
