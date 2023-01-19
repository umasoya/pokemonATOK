#!/bin/bash

# Dependencies
#   - curl
#   - jq
#   - uconv

set -eu

# load modules
source __vars
source __validate
source __option
source __print
source __utils
source __debug

if "${DEBUG}"; then
  __debug::var_dump
fi

__validate::range ${FROM} ${TO} ${MAX_GEN}

for GEN in $(seq ${FROM} ${TO}); do
  if "${VERBOSE}" || "${DEBUG}"; then
    CURL_OPTION=''
  else
    CURL_OPTION='-s'
  fi

  __print::verbose "curl ${API}/generation/${GEN} | jq -r '.pokemon_species[] | .url' | sort -V"
  URLS=$(curl ${CURL_OPTION} "${API}/generation/${GEN}/" | jq -r '.pokemon_species[] | .url' | sort -V)

  if "${BUNDLE}"; then
    FILENAME=${OUTPUT}
  else
    FILENAME="${OUTPUT}_gen${GEN}"
  fi

  for URL in ${URLS}; do
    __utils::ifs_backup && __utils::ifs_newline
    __print::verbose "curl ${CURL_OPTION} ${URL} | jq -r '.names[] | select(.language.name == \"ja\") | .name'"
    __utils::ifs_reset

    NAME=$(curl ${CURL_OPTION} "${URL}" | jq -r '.names[] | select(.language.name == "ja") | .name')
    YOMIGANA=$(echo ${NAME} | uconv -x hiragana)
    ROW="${YOMIGANA}\t${NAME}\t${CLASS}*"

    __print::toFile ${ROW} ${FILENAME}
  done
done
