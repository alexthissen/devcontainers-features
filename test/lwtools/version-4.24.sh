#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute lwasm" bash -c "lwasm --version | grep 'lwasm from lwtools 4.24'"
check "execute lwcc-cpp" bash -c "lwcc-cpp --version | grep 'lwcc-cpp from lwtools 4.24'"
check "execute lwar" bash -c "lwar --version 2>&1 | grep 'You must specify an archive file.'"
check "execute lwlink" bash -c "lwlink --version 2>&1 | grep 'No input files'"
check "execute lwobjdump" bash -c "lwobjdump --version 2>&1 | grep 'Must specify exactly one input file.'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
