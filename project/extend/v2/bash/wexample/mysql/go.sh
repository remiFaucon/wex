#!/usr/bin/env bash

mysqlGo() {
  . ${WEX_WEXAMPLE_SITE_CONFIG}
  docker exec -it ${SITE_NAME_INTERNAL}_mysql sh -c "mysql $(wex mysql/loginCommand -i)"
}