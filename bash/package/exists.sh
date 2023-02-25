#!/usr/bin/env bash

packageExistsArgs() {
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'name n "Package name to find" true'
  )
}

packageExists() {
  # Prevent empty value.
  if [ "${NAME}" == "true" ] || [ "${NAME}" == "" ]; then
    echo false
    return
  fi

  # Method works both on linux and windows.
  hash ${NAME} 2>/dev/null
  AVAILABLE=$?
  if [ ${AVAILABLE} -eq 0 ]; then
    echo true
  else
    echo false
  fi
}
