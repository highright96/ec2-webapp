pipeline {
  agent any

  environment {
    CONTAINER_NAME = 'ec2'
    IMAGE_NAME = 'ec2:latest'
  }

  stages {
    stage('git clone'){
      agent any
      steps {
        echo 'Clone Repository Start'
        git url: 'https://github.com/highright96/jenkins.git',
          branch: 'master'
          credentialId: 'github'
      }
      post {
        success {
          echo 'Cloned Repository Success'
        }
      }
    }

    stage('build'){
      agent any
      steps {
        echo 'Build Start'
        sh './gradlew clean build'
      }
      post {
        success {
          echo 'Build Success'
        }
        failure {
          error 'Build Failure -> Stop'
        }
      }
    }

    stage('deploy'){
      agent any
      steps {
        echo 'Deploy Start'
        sh """
        docker stop env.
        docker rm ${CONTAINER_NAME}
        docker rmi ${IMAGE_NAME}
        docker build -t ${IMAGE_NAME} .
        docker run -d --name ${CONTAINER_NAME} -p 9090:9090 -v /home/jenkins:/var/jenkins_home ${IMAGE_NAME}
        """
      }
      post {
        success {
          mail to: 'highright96@gmail.com'
               subject: '배포 성공'
               body: '배포를 성공했습니다.'
        }
      }
    }
  }
}