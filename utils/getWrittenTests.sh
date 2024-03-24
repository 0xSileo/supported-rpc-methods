#!/bin/bash

# Checks in the tests folder for io files and prints lines starting with ">> " (grep part), then removes the ">> " chars (sed part)
# then only prints previously unseen methods and finally puts all of that in a file named fetchedTests.txt
find ../libs/execution-api/tests/ -type f -name "*.io" -exec grep -h '^>> ' {} + | sed 's/^>> //' | awk -F',' '!seen[$3]++' > fetchedTests.txt

