#!/usr/bin/env bash

packageExistsTest() {
  # There is a good chance that bash was installed
  VALUE=$(wex-exec package/exists -n="bash")
  _wexTestAssertEqual "${VALUE}" true

  VALUE=$(wex-exec package/exists -n="undefinedTestPackage")
  _wexTestAssertEqual "${VALUE}" false
}
