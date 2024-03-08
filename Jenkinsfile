node {
    
    
stage('checkout code')
git branch: 'main', url: 'https://github.com/AbdulSKS/Opika-Abdul-Rehman.git'


stage('Run')
sh 'npm run'
    
stage('Build')
sh 'npm install'

stage('Docker Image Creation')
sh "docker build -t olyumpus/test:1 . "

stage('Docker Credentials')
withCredentials([string(credentialsId: 'Dockerpassword', variable: 'Dockerpassword')]) {
sh "docker login -u olyumpus -p ${Dockerpassword} "
}

stage('Docker Image push')
sh "docker push olyumpus/test:1 "

stage('Docker Container Creation')
sh "docker run -d -name test -p 3000:3000 olyumpus/test:1 "



}
