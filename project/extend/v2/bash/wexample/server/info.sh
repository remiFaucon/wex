#!/usr/bin/env bash

serverInfo() {
  REGISTRY=$(cat ${WEX_WEXAMPLE_DIR_PROXY_TMP}sites)

  for SITE_PATH in ${REGISTRY[@]}
  do
    # Avoid blank lines.
    if [[ $(${WEX_DIR_V3_CMD} string/trim -s=${SITE_PATH}) != "" ]];then
      echo -e "  Path : \t"${SITE_PATH}
    fi
  done;

  cat ${WEX_WEXAMPLE_DIR_PROXY_TMP}config
}
