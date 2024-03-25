# Extract unique method values
#
QUERIES_FILE="../results/queries.csv"
unique_methods=$(csvcut -c METHOD "$QUERIES_FILE" | tail -n +2 | sort -u)
unique_endpoints=$(csvcut -c ENDPOINT "$QUERIES_FILE" | tail -n +2 | sort -u | wc -l)

# Print header
echo "| METHOD | $(csvcut -c ENDPOINT "$QUERIES_FILE" | tail -n +2 | sort -u | tr '\n' ' ' | sed 's/ $//' | sed 's/ / | /g') |"

# Print separator
printf "|-----%.0s" $(seq 1 $((unique_endpoints + 1))); echo "|"

# Iterate through each unique method
for method in $unique_methods; do
    # Print method value
    echo -n "| $method | "

    # Extract success values for endpoints corresponding to the method
    success_values=$(csvgrep -c METHOD -m "$method" "$QUERIES_FILE" | csvcut -c ENDPOINT,SUCCESS | tail -n +2)

    # Iterate through each endpoint and its success value for the current method
    while IFS=, read -r endpoint success; do
        # Print success value for the endpoint and that method
		 if [ "$success" == "True" ]; then
            echo -n "✅ | "
        else
            echo -n "❌ | "
        fi
    done <<< "$success_values"

    # Print newline
	echo
done
