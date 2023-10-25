#!/bin/bash

input_dir="input"

# Check if the input directory exists
if [ ! -d "$input_dir" ]; then
  echo "The input directory '$input_dir' does not exist."
  exit 1
fi

# Loop through each file in the input directory
for file in "$input_dir"/*; do
  if [ -f "$file" ]; then
    import_output=$(rnpkeys --import "$file")

    # Extract the key ID from the "ssb" line
    key_id=$(echo "$import_output" | grep -oP 'ssb\s+255/\S+ \K[0-9a-f]+')

    # Extract the key fingerprint from the "sec" line
    fingerprint=$(echo "$import_output" | grep -oP 'sec\s+255/\S+ \K[0-9a-f]+')

    if [ -n "$key_id" ] && [ -n "$fingerprint" ]; then
        # Run the command to fix the CV25519 bits
        rnpkeys --edit-key --fix-cv25519-bits "$key_id"

        # Run the command to export the secret key
        rnpkeys --export-key --secret --output "output/$(basename "$file")" "$fingerprint"

        echo "Processed file: $file"
    else
        echo "Error processing file: $file"
    fi
  fi
done
