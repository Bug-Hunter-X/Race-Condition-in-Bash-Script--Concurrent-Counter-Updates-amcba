#!/bin/bash

# This script demonstrates a race condition where two processes try to update a shared counter simultaneously.
# The expected output is 1000, but due to the race condition, it will likely be less.

counter=0

# Function to increment the counter
increment_counter() {
  local i
  for i in {1..100}; do
    let counter+=1
  done
}

# Create two processes to increment the counter
increment_counter &
increment_counter &

wait # Wait for both processes to finish

echo "Final counter value: $counter"