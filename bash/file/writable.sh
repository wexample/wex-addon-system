#!/usr/bin/env bash

fileWritableArgs() {
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'file f "File" true'
  )
}

fileWritable() {
  [ -w "${FILE}" ] && echo true || echo false
}
