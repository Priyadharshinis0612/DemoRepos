pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/tmp/maven"
        DEMO = "Demo"
    }
    
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn -version'
                sh 'echo id = `id`'
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        // Uncomment this stage if you plan to implement SonarQube analysis
        /*
        stage('SonarAnalysis') {
            def scannerHome = tool 'SonarQubeScanner'
            agent { label 'docker' } 
            steps {
                sh 'echo to be implemented'
                withSonarQubeEnv('SonarServer') {
                    sh '/home/sidkalpop/scanner/bin/sonar-scanner'
                    sh 'echo to be implemented'
                }
            }
        }
        */

        stage('Package & Deploy') {
            steps {
                sh 'mvn package install'
            }
        }

        stage('Build Docker file') {
            steps {
                sh 'docker build . -t priyadharshinis0612/demoreposapp -f DockerfileBuild'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHub_Credentials', passwordVariable: 'PASSWORD', usernameVariable: 'USER')]) {
                    sh 'echo $PASSWORD | docker login -u $USER --password-stdin'
                    sh 'docker logout'
                }
            }
        }
    }
}
