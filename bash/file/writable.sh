#!/usr/bin/env bash

fileWritableArgs() {
  _DESCRIPTION="Returns true if file is writable"
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'file f "File" true'
  )
}

fileWritable() {
  [ -w "${FILE}" ] && echo true || echo false
}
