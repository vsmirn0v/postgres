#!/bin/bash

if [[ ",$postinitdb_actions," = *,simple_db,* ]]; then
psql --command "ALTER USER \"${POSTGRESQL_USER}\" WITH ENCRYPTED PASSWORD '${POSTGRESQL_PASSWORD}';"
psql --command "ALTER USER \"${POSTGRESQL_USER}\" WITH SUPERUSER;"
fi

if [ -v POSTGRESQL_MASTER_USER ]; then
psql --command "ALTER USER \"${POSTGRESQL_MASTER_USER}\" WITH REPLICATION;"
psql --command "ALTER USER \"${POSTGRESQL_MASTER_USER}\" WITH ENCRYPTED PASSWORD '${POSTGRESQL_MASTER_PASSWORD}';"
fi

if [ -v POSTGRESQL_ADMIN_PASSWORD ]; then
psql --command "ALTER USER \"postgres\" WITH ENCRYPTED PASSWORD '${POSTGRESQL_ADMIN_PASSWORD}';"
fi
