#!/usr/bin/env bash

dirSpaceArgs() {
  _DESCRIPTION="Return current directory subfolder spaces"
}

# Gives the cumulative disk usage of all non-hidden directories.
dirSpace() {
  du -sh -- * | sort -h
}
