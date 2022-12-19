#!/usr/bin/env bash

portUsedArgs() {
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
