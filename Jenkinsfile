pipeline {
  agent any
  environment {
    SAUCE_USERNAME = credentials('sauce-username')
    SAUCE_ACCESS_KEY = credentials('sauce-access-key')
    CI = true
    SAUCECTL_VERSION = 0.19.0
    SAUCECTL_BINARY = saucectl_${SAUCECTL_VERSION}_linux_64-bit.tar.gz
  }
  stages {
    stage ('download') {
      steps {
        // This step downloads the saucectl binary
        sh 'curl -L -o ${SAUCECTL_BINARY} \ 
        -H "Accept: application/octet-stream" \ 
        https://github.com/saucelabs/saucectl/releases/download/v${SAUCECTL_VERSION}/${SAUCECTL_BINARY} \ 
        && tar -xvzf ${SAUCECTL_BINARY}'
      }
    }
    stage ('permissions')
      // This step is for a workaround for container permissions
      steps {
        sh 'sudo chmod -R 777 tests/'
      }
    }
    stage('run') {
      steps {
        // This step triggers the tests
        sh './saucectl run -c ./.sauce/cypress.yml --verbose'
      }
    }
  }
}
