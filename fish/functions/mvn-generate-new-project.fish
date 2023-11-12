function mvn-generate-new-project --wraps=mvn\ \\\n\ \ archetype:generate\ \\\n\ \ -DarchetypeArtifactId=javase-quickstart\ \\\n\ \ -DarchetypeGroupId=com.smartsystems --description alias\ mvn-generate-new-project\ mvn\ \\\n\ \ archetype:generate\ \\\n\ \ -DarchetypeArtifactId=javase-quickstart\ \\\n\ \ -DarchetypeGroupId=com.smartsystems
  mvn \
  archetype:generate \
  -DarchetypeArtifactId=javase-quickstart \
  -DarchetypeGroupId=com.smartsystems $argv
        
end
