#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute lcc" bash -c "lcc 2>&1 | grep 'lcc [ option | file ]...'"
check "execute rcc" bash -c "rcc 2>&1 | grep 'cc: unknown target'"
check "execute copt" bash -c "copt -? 2>&1 | grep 'copt: can't open patterns file'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
