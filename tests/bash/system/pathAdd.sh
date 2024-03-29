#!/usr/bin/env bash

systemPathAddTest() {
  local COMMAND
  local FILEPATH
  local NEW_PATH

  NEW_PATH=/toto/tata

  FILEPATH=$(_wexTestSampleInit bashrc)
  COMMAND=$(wex-exec system/pathAdd -p=${NEW_PATH} -b="${FILEPATH}")
  _wexTestSampleDiff bashrc true "Command added to test bashrc file"

  _wexTestAssertNotEmpty "${COMMAND}"
}
