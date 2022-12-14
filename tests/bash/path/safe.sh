#!/usr/bin/env bash

pathSafeTest() {
  _wexTestAssertEqual "$(wex path/safe -p="/")" "/"
}
