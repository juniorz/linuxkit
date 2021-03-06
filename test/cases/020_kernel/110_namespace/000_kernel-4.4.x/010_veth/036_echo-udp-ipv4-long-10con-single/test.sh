#!/bin/sh
# SUMMARY: Namespace stress with 10 concurrent long running UDP/IPv4 "connections" over a veth pair
# LABELS:
# REPEAT:

set -e

# Source libraries. Uncomment if needed/defined
#. "${RT_LIB}"
. "${RT_PROJECT_ROOT}/_lib/lib.sh"

clean_up() {
    find . -depth -iname "test-ns*" -not -iname "*.yml" -exec rm -rf {} \;
}
trap clean_up EXIT

# Test code goes here
moby build -format kernel+initrd test-ns.yml
RESULT="$(linuxkit run -cpus 2 test-ns)"
echo "${RESULT}" | grep -q "suite PASSED"

exit 0
