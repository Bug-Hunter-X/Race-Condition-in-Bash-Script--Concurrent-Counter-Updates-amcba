#!/bin/bash

# This script demonstrates the solution to the race condition using a lock file.

counter=0
lock_file="counter.lock"

# Function to increment the counter with locking
increment_counter() {
  local i
  flock -n "$lock_file" || exit 1 # Acquire the lock, exit if failed
  for i in {1..100}; do
    let counter+=1
  done
  echo "$counter" > "counter.txt"
  flock -u "$lock_file" # Release the lock
}

# Create two processes to increment the counter with locking mechanism
increment_counter &
increment_counter &

wait # Wait for both processes to finish

#read counter from file
counter=$(cat counter.txt)
echo "Final counter value: $counter"