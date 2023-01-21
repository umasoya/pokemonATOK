#!/bin/bash

# Dependencies
#   - curl
#   - jq
#   - uconv

set -eu

#
# load modules
#
source modules/__vars
source modules/__buffer
source modules/__validator
source modules/__options
source modules/__debug
source modules/__formatter
source modules/__print
source modules/__utils
source modules/__core

__debug::var_dump

#
# validate option args
#
__validator::integer ${FROM} f
__validator::integer ${TO} t
__validator::range ${FROM} ${TO} ${MAX_GEN}

# stores value in ${URLS}
__core::fetch_urls ${FROM} ${TO}

# store pokemons data in ${POKEMONS}
__core::fetch_pokemons

__core::generate_filenames

__formatter::atok

__core::write

#__core::execute

exit 0
