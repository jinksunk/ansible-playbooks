pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sh "chmod u+x ./deploy.sh"
                sh "sudo ./deploy.sh --branch-name=${env.GIT_BRANCH}"
            }
        }
    }
}
