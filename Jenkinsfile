pipeline{
    
    agent any;
    
    stages{
        stage("Code"){
            steps{
                git url: "https://github.com/Rachit-thakur/java-quotes-app.git", branch: "main"
            }
        }
        stage("Build"){
            steps{
                sh "docker build -t java-quotes-app ."
            }
        }
        stage("Test") {
            steps {
        echo "Running tests..."
    }
}

        stage("Deploy"){
            steps{
                sh "docker compose up -d --build java-quotes-app"
            }
        }
    }
}
