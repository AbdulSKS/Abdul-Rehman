node
{
 
  stage("CheckOutCodeGit")
  {
   git branch: 'main', credentialsId: 'cf80b27b-b699-4813-97ae-7b718406c001', url: 'https://github.com/AbdulSKS/Opika-Abdul-Rehman.git'
  }
 
 stage("Build")
 {
 nodejs(nodeJSInstallationName: 'nodejs15.2.1') {
        sh 'npm install'
    }
 }  
 
  
		
    stage('Deploy') {
       nodejs(nodeJSInstallationName: 'nodejs15.2.1') {
          sh 'npm publish'
      }
      
          }	
 
 stage('RunNodeJsApp')
 {
 //sh "./scripts/run.sh"
 nodejs(nodeJSInstallationName: 'nodejs15.2.1') {
        sh 'npm start &'
    }
}    
    
}
