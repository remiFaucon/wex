#!/usr/bin/env bash

serviceUsedArgs() {
  _ARGUMENTS=(
    'service s "Service to install" true',
  )
}

serviceUsed() {
  local SERVICES=("$(wex service/list)")

  # Array contains
  if [[ " ${SERVICES[@]} " =~ " ${SERVICE} " ]]; then
    echo true
    return
  fi

  echo false
}