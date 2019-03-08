pipeline {
  agent any
  stages {
    stage ("build") {
     steps{
      sh 'mvn -f otherdirectory/pom.xml clean install'
     }
    }
  }
}
