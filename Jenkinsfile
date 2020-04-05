pipeline {
  agent any
  stages {
    stage('Setup') {
      steps {
        sh 'make setup'
      }
    }

    stage('Lint') {
      steps {
        sh 'make lint'
      }
    }

    stage('Build image') {
      steps {
        sh 'make build'
        sh 'make push'
      }
    }

    stage('Deploy') {
      steps {
        sh 'make deploy'
      }
    }

  }
}