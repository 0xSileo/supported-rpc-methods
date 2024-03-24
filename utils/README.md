The `listMethods.sh` script outputs a list of current methods present in the JSON-RPC Ethereum specification in the file named `methodList.txt`


The `getWrittenTests.sh` serves as a first working base for writing tests for methods. The difference between this repo's goal and the execution-api tests, is that we'll just check if the methods are supported, we won't test for edge cases or error handling, which is why in the script we use `| awk -F',' '!seen[$3]++' `, removing lines where previously tested methods are tested again. 