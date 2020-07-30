pipeline {

  agent any

  stages {

    stage('Build') {
      steps {
        sh './gradlew clean assemble'
      }
    }

    stage('Static Analysis') {
      steps {
        sh './gradlew sonarqube'
      }
    }

    stage('Analyze security of dependencies') {
      steps {
         sh './gradlew dependencyCheckAnalyze'
      }
    }
  }
}
