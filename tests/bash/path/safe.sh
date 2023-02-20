#!/usr/bin/env bash

pathSafeTest() {
  _wexTestAssertEqual "$(wex-exec path/safe -p="/")" "/"
}
