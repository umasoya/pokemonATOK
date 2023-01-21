#!/bin/bash

# Dependencies
#   - curl
#   - jq
#   - uconv

set -eu

#
# load modules
#

# must be first
source modules/__vars
# no order
source modules/__buffer
source modules/__debug
source modules/__formatter
source modules/__options
source modules/__print
source modules/__validator
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

# stores value in ${URLS}
__core::fetch_urls ${FROM} ${TO}

__core::execute

exit 0
