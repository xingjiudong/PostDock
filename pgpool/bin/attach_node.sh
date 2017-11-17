#!/usr/bin/env bash

DOWN_COUNT=$(PGCONNECT_TIMEOUT=$CHECK_PGCONNECT_TIMEOUT PGPASSWORD=$CHECK_PASSWORD psql -U $CHECK_USER -h 127.0.0.1 template1 -c 'show pool_nodes' | grep down | wc -l)
DOWN_NODE=$(PGCONNECT_TIMEOUT=$CHECK_PGCONNECT_TIMEOUT PGPASSWORD=$CHECK_PASSWORD psql -U $CHECK_USER -h 127.0.0.1 template1 -c 'show pool_nodes' | grep down)
DOWN_NODE_ID=$(echo ${DOWN_NODE} | cut -b -1)

if [[ "$DOWN_COUNT" == "1" ]]; then
    pcp_attach_node -U pcp_user -w  -h localhost -n ${DOWN_NODE_ID}  
else
    exit 0
fi
