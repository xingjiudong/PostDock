#!/usr/bin/env bash

set -e

echo '>>> TUNING UP POSTGRES...'
echo "*:$REPLICATION_PRIMARY_PORT:*:$REPLICATION_USER:$REPLICATION_PASSWORD" >> /home/postgres/.pgpass
chmod 0600 /home/postgres/.pgpass
chown postgres:postgres /home/postgres/.pgpass

echo '>>> STARTING POSTGRES...'
/usr/local/bin/cluster/postgres/entrypoint.sh