#!/usr/bin/env bash

systemIp() {
  if [ "$(wex-exec docker/isToolBox)" = true ];then
    wex-exec docker/ip
    return
  fi
  # Enforce language for parsing.
  export LC_ALL=C
  # May have several IP's
  IPS=($(ip addr show | awk '/inet /{print $2}' | cut -d'/' -f1 | grep -v '127.0.0.1'))
  # Revert to default language.
  unset LC_ALL
  # Take the last one
  echo "${IPS[-1]}"
}
