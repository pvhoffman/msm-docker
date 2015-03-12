#!/bin/bash
echo "******CREATING MOBILE SALESMAGIC DATABASE******"

echo "starting postgres"
gosu postgres pg_ctl -w start

echo "initializing tables"
gosu postgres psql -h localhost -p 5432 -U postgres -d salesmagic -a -f /docker-entrypoint-initdb.d/msm-database-init.sql

echo "stopping postgres"
gosu postgres pg_ctl stop

echo "stopped postgres"

echo ""
echo "******MOBILE SALESMAGIC DATABASE CREATED******"


