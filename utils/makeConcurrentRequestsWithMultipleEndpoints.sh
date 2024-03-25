#!/bin/bash

# Define an array to store CURL responses

#TODO CHECK IF FILE EXISTS


echo "ID,METHOD,ENDPOINT,TIMESTAMP" >> queriesTemp.csv
echo "ID,SUCCESS" >> queriesSuccess.csv

# Put manual tests and pre existent tests in a single file
cat manualTests.txt > allTests.txt
cat fetchedTests.txt >> allTests.txt

# Function to make curl requests with modified "id" values
make_curl_request() {
    local line="$1"
    local enpoint_index="$2"
    local line_index="$3"
    local url="$4"  # API endpoint URL
	local timestamp="$5"
    # Calculate the "id" value
    local id=$((endpoint_index * 1000 + line_index))

	local methodname=$(echo $line | jq '.method')
	echo "$id,$methodname,\"$url\",$timestamp" >> queriesTemp.csv

    # Modify the "id" value in JSON
    local modified_json=$(echo "$line" | jq ".id = $id")

    # Make curl request
	curl -s -X POST -H "Content-Type: application/json" -d "$modified_json" "$url" >> testResponses.txt &
}

# Main script starts here
api_endpoints_file="api_endpoints.txt"  # File containing API endpoints
lines_file="allTests.txt"  # File containing lines to test
timestamp=$(date +%s)
# Read API endpoints file
endpoint_index=0
while IFS= read -r api_endpoint; do
	endpoint_index=$((enpoint_index++))
    
    # Read lines file for each API endpoint
    line_index=0
    while IFS= read -r line; do
        ((line_index++))
        
        # Call function to make curl request with modified "id"
        make_curl_request "$line" "$endpoint_index" "$line_index" "$api_endpoint" "$timestamp"
    done < "$lines_file"
done < "$api_endpoints_file"

# Wait for all curl requests to finish
wait


# Printing to file
# I tried the -w "\n" option in curl but still got some wrong results
sed -i 's/}{/}\n{/g' testResponses.txt
# Remove empty lines 
sed -i '/^$/d' testResponses.txt

# Read each line of the file
while IFS= read -r response_line; do
    # Check if the line is a valid JSON object
    if jq -e . >/dev/null 2>&1 <<< "$response_line"; then
        # Check if the JSON object has "result" field
		id=$(jq '.id' <<<  "$response_line")
		succeeded=$(jq 'has("result")' <<< "$response_line")
		echo $id,$succeeded >> queriesSuccess.csv
    else
        echo "Invalid JSON"
    fi
done < testResponses.txt


csvjoin -c "ID" queriesTemp.csv queriesSuccess.csv > queriesResults.csv
csvcut -C "ID" queriesResults.csv > queries.csv
