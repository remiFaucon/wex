#!/usr/bin/env bash

siteContainersStartedArgs() {
  _ARGUMENTS=(
    [0]='all a "All containers runs" false',
  )
}

siteContainersStarted() {
  # Get site name.
  CONTAINERS=$(wex site/containers)
  # If empty stop here.
  if [ "${CONTAINERS}" == "" ];then
    echo false
    return
  fi
  CONTAINERS=$(wex array/join -a="${CONTAINERS}" -s=",")
  # Expect all containers runs.
  wex docker/containerStarted -n="${CONTAINERS}" -a=${ALL}
}
