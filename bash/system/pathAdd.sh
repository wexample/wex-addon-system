#!/usr/bin/env bash

systemPathAddArgs() {
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'new_path p "New path" true'
    'bashrc_path b "Bashrc path" false'
  )
}

systemPathAdd() {
  # Convert slashes
  NEW_PATH=$(echo "${NEW_PATH}" | sed 's/\//\\\//g')

  # Search occurrence of new path.
  foundInBody=$(sed -n "s/\(.\{0,\}\):\(${NEW_PATH}\):\(.\{0,\}\)/\2/p" <<<${PATH_CONTENT})
  foundAtEnd=$(sed -n "s/\(.\{0,\}\):\(${NEW_PATH}\)$/\2/p" <<<${PATH_CONTENT})

  # Return command to execute globally
  if [ "${foundInBody}" == "" ] && [ "${foundAtEnd}" == "" ]; then
    # Print command to add, need to execute it into global context.
    echo 'export PATH=$PATH:'${NEW_PATH}
  fi

  # Default pathg
  if [ "${BASHRC_PATH}" == '' ]; then
    BASHRC_PATH=~/.bashrc
  fi

  command='export PATH=\$PATH:'
  # Protect arguments by escaping special chars.
  command=$(sed -e 's/[]\/$\{0,\}.^|[]/\\&/g' <<<"${command}")${NEW_PATH}

  # Add to bashrc.
  wex-exec file/textAppendOnce -f="${BASHRC_PATH}" -l="${command}"
}
