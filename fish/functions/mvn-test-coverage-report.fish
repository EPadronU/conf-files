function mvn-test-coverage-report
    mvn clean verify org.pitest:pitest-maven:mutationCoverage site $argv
end

