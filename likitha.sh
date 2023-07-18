#!/bin/bash

# File path to modify
file="/root"
read file

# Check if the file exists
if [ -f "$file" ]; then
  # Count the total number of lines in the file
  total_lines=$(wc -l < "$file")

  # Calculate the number of lines to delete
  lines_to_delete=3

  # Calculate the starting line number to delete
  start_line=$((total_lines - lines_to_delete + 1))

  # Delete the last 3 lines using sed
  sed -i "${start_line},\$d" "$file"

  # Check if the lines were deleted successfully
  if [ $? -eq 0 ]; then
    echo "Last 3 lines deleted from '$file'."
  else
    echo "Failed to delete last 3 lines from '$file'."
  fi
else
  echo "File '$file' does not exist."
fi

