#!/usr/bin/env bash

pathSafeArgs() {
  _DESCRIPTION="Return true if path is not a well known risky path"
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'path_name p "Path" true'
  )
}

pathSafe() {
  # Os is windows
  if [ "$(wex-exec system/os)" = "windows" ]; then
    local FIRST_LETTER
    FIRST_LETTER="$(echo "${PATH_NAME}" | head -c 1)"

    # Path is not already converted.
    if [ "${FIRST_LETTER}" = "/" ]; then
      wex-exec path/posixToWindows -p="${PATH_NAME}"
      return
    fi
  fi

  echo "${PATH_NAME}"
}
