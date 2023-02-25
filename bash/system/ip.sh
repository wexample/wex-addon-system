#!/usr/bin/env bash

systemIp() {
  if [ "$(wex-exec docker/isToolBox)" = true ]; then
    wex-exec docker/ip
    return
  fi
  # Enforce language for parsing.
  export LC_ALL=C
  # May have several IP's
  IPS=($(ip route get 198.51.100.1 | sed -n 's/.* src \([^[:space:]]*\) .*/\1/p'))
  # Revert to default language.
  unset LC_ALL
  # Take the last one
  echo "${IPS[-1]}"
}
