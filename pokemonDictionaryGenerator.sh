#!/bin/bash

# Dependencies
#   - curl
#   - jq
#   - uconv

set -eu

#
# load modules
#

# no order
source modules/__vars
source modules/__options
source modules/__print
source modules/__formatter
source modules/__validator
source modules/__debug
# must be last
source modules/__utils
source modules/__core

__debug::var_dump

#
# validate option args
#
__validator::integer ${FROM} f
__validator::integer ${TO} t
__validator::range ${FROM} ${TO} ${MAX_GEN}

__core::fetch_urls ${FROM} ${TO}

__core::fetch_pokemon

exit 0
