#!/usr/bin/env bash

portUsedArgs() {
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'port_number p "Port number" true'
  )
}

portUsed() {
  if [ "$(sudo netstat -tunlp | grep ":${PORT_NUMBER} ")" != "" ]; then
    echo true
  else
    echo false
  fi
}
