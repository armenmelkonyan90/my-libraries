pipeline {
    agent{
        label 'server'
    }
    stages {
        stage('stop old docker-compose') {
            steps {
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StopService', service: 'server'], useCustomDockerComposeFile: false])
                }
            }
        stage('start docker-compose') {
            steps {
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartService', scale: 1, service: 'server'], useCustomDockerComposeFile: true])
                sleep 30
                    
            }
        }
        stage('stop docker compose') {
            steps {
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StopService', service: 'server'], useCustomDockerComposeFile: false])
            }
        }      
    }
}
