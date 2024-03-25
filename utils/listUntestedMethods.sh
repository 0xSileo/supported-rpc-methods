cat fetchedTests.txt | jq '.method' > testedMethods.txt
grep -F -x -v -f testedMethods.txt methodList.txt > untestedMethods.txt
