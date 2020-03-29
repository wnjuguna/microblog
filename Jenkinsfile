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

  }
}