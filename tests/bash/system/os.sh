#!/usr/bin/env bash

systemOsTest() {
  _wexTestAssertEqual "$(wex system/os)" "linux"
}
