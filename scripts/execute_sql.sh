#!/bin/bash
# Script takes sql file as a parameter
# it runs in the loop doing the following:
#  - It executes the sql script random number of times
#  - it sleeps for random number of seconds
#
while true; do 
	for i in {1..$((RANDOM % 10))}; do
		PGPASSWORD=postgres psql -d 'postgresql://postgres@proxy:1999/postgres?sslmode=disable' -f $1; 
	done
	# now sleep for random number of seconds
	sleep $((1 + RANDOM % 5));
done 
