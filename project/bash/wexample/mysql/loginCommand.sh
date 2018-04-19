#!/usr/bin/env bash

mysqlLoginCommand() {
  # Load credentials stored into config
  wex config/load

  echo -h${SITE_NAME}_mysql -u${SITE_DB_USER} -p${SITE_DB_PASSWORD} ${SITE_DB_NAME}
}
