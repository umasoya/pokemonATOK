#!/bin/bash

# Dependencies
#   - curl
#   - jq
#   - uconv

set -eux

API='https://pokeapi.co/api/v2'

FILENAME='pokemon_gen'

# SV(9世代(SV)はAPI側が未対応 2023/01/19現在)
MAX_GEN=8

# 品詞
HINSHI='固有一般'

for GEN in $(seq 1 ${MAX_GEN}); do
  URLS=$(curl "${API}/generation/${GEN}/" | jq -r '.pokemon_species[] | .url' | sort -V)

  for URL in ${URLS}; do
    NAME=$(curl "${URL}" | jq -r '.names[] | select(.language.name == "ja") | .name')
    YOMIGANA=$(echo ${NAME} | uconv -x hiragana)
    echo "${YOMIGANA}\t${NAME}\t${HINSHI}*" >> "${FILENAME}${GEN}"
  done
done
