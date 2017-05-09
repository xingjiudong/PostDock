#!/usr/bin/env bash

set -e

/usr/local/bin/cluster/ssh.sh
/usr/local/bin/cluster/postgres.sh &
sleep infinity