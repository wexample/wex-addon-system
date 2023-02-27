#!/usr/bin/env bash

diskSpaceArgs() {
  _DESCRIPTION="Display the amount of free and used space on the file system"
}

diskSpace() {
  df -H
}
