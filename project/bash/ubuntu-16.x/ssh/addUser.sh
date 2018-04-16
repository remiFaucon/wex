#!/usr/bin/env bash

sshAddUserArgs() {
  _ARGUMENTS=(
    [0]='user u "User" true'
    [1]='group g "Host" true'
    [2]='key k "SSH Key to use" true'
  )
}

sshAddUser() {
  if [ "${GROUP}" == "" ];then
    local GROUP=${USER}
  fi

  # Create SSH dir.
  mkdir -p /home/${USER}/.ssh
  chown ${USER}:${GROUP} /home/${USER}/.ssh
  chmod 700 /home/${USER}/.ssh

  # Add wexample SSH key
  wex file/textAppend -f=/home/${USER}/.ssh/authorized_keys -l="${KEY}"

  chown ${USER}:${GROUP} /home/${USER}/.ssh/authorized_keys
  chmod 600 /home/${USER}/.ssh/authorized_keys
}
