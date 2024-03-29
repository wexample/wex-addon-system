#!/usr/bin/env bash

systemOsArgs() {
  # shellcheck disable=SC2034
  _DESCRIPTION="Return the local OS name"
}

systemOs() {
  case "$(uname -s)" in
  Darwin)
    echo 'mac'
    ;;
  Linux)
    echo 'linux'
    ;;
  CYGWIN* | MINGW32* | MINGW64* | MSYS*)
    echo 'windows'
    ;;
  # Add here more strings to compare
  # See correspondence table at the bottom of this answer
  *)
    echo 'other OS'
    ;;
  esac
}
