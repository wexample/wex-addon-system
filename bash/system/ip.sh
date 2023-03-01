#!/usr/bin/env bash

systemIpArgs() {
  # shellcheck disable=SC2034
  _DESCRIPTION="Return the local IP"
}

systemIp() {
  hostname -I | awk '{print $1}'
}
