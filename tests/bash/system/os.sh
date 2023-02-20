#!/usr/bin/env bash

systemOsTest() {
  _wexTestAssertEqual "$(wex-exec system/os)" "linux"
}
