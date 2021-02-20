#!/bin/bash
#
# This script execute three different steps using pgbench PostgreSQL tool
# to generate traffic:
# - running custom SQL scripts
# - running TPC-B transactions (SELECT-only)
# - running TPC-B transactions (Read/Write)
#
CONNSTR='postgresql://postgres@envoy:1999/postgres?sslmode=disable'
PROTOCOLS='simple extended prepared'
PWD=$(dirname $0)

# initialize benchmark database
pgbench -i -s10 -d "${CONNSTR}"

while true; do

    # random concurrent clients running transactions
    CLIENTS=$((RANDOM % 10 + 1))
    # random number of transactions to run TPC-B tests
    TRANSACTIONS=$(((RANDOM % 10 + 1) * ${CLIENTS}))
    # base pgbench command
    PGBENCH="pgbench -n -c ${CLIENTS} -t ${TRANSACTIONS} -d ${CONNSTR}"

    # run custom SQL scripts
    for script in ${PWD}/*.sql; do
        PGPASSWORD=postgres ${PGBENCH} -f ${script} &
    done

    # run TPC-B for different protocols: simple, extended and prepared
    for protocol in ${PROTOCOLS}; do
        # SELECT-only transactions
        PGPASSWORD=postgres ${PGBENCH} -M ${protocol} -S &
        # Write transactions
        PGPASSWORD=postgres ${PGBENCH} -M ${protocol} &
    done
    wait

	# now sleep for random number of seconds
    sleep $((RANDOM % 3 + 1));
done 
