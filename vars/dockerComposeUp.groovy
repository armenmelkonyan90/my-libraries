def call(debug flask_debug) {
	sh 'echo DEBUG=debug >> .env'
        sh 'echo FLASK_DEBUG=flask_debug >> .env'
	step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartService', scale: 1, service: 'server'], useCustomDockerComposeFile: true])
        sleep 30
        step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StopService', service: 'server'], useCustomDockerComposeFile: false])
}
