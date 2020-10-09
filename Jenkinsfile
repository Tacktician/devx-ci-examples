pipeline {
  agent {
    docker {
        image 'saucelabs/stt-puppeteer-jest-node:v0.1.8'
    }
  }
  environment {
    SAUCE_USERNAME = credentials('sauce-username')
    SAUCE_ACCESS_KEY = credentials('sauce-access-key')
    CI = true //this is fucking stupid
  }
  stages {
    stage('run') {
      steps {
        // This step trigger the tests
        sh 'saucectl run -c ./.sauce/config.yml --verbose'
      }
    }
  }
}