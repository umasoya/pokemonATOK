#!/bin/bash

# Dependencies
#   - curl
#   - jq
#   - uconv

set -eu

# load modules
source modules/__vars
source modules/__validate
source modules/__options
source modules/__print
source modules/__utils
source modules/__core
source modules/__debug

if "${DEBUG}"; then
  __debug::var_dump
fi

# validate option args
__validate::integer ${FROM} f
__validate::integer ${TO} t
__validate::range ${FROM} ${TO} ${MAX_GEN}

URLS=()
__core::fetch_urls ${FROM} ${TO}

__core::fetch_pokemon

exit 0
