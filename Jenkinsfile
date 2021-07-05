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
      }
      post {
        success {
          echo 'Cloned Repository Success'
        }
        failure {
          error 'Build Failure -> Stop'
          mail to: 'highright96@gmail.com'
               subject: 'Jenkins Failure Email'
               body: 'Git Clone Failed.'
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
          mail to: 'highright96@gmail.com'
               subject: 'Jenkins Failure Build'
               body: 'Build Failed.'
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
               subject: 'Jenkins Success Build'
               body: 'Deploy Success'
        }
      }
    }
  }
}