# Race Condition in Bash Script

This repository demonstrates a race condition in a bash script where two processes concurrently try to update a shared counter. The script uses two processes to increment a counter 100 times each, leading to an inaccurate final count because of the race condition. The solution provided uses a locking mechanism to address this race condition. 

## Bug Description
The script exhibits a race condition, leading to an incorrect final value of the counter. Two parallel processes attempt to update the counter simultaneously, resulting in lost updates.

## Solution Description
The solution employs a locking mechanism (using a lock file) to ensure that only one process can access and modify the counter at a time. This prevents race condition and guarantees the correct final counter value.

## How to run
1. Clone the repository
2. Run the `bug.sh` script to observe the race condition.
3. Run the `bugSolution.sh` to see the corrected behavior.