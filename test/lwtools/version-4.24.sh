#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute lwasm" bash -c "lwasm --version 2>&1 | grep '4.24'"
check "execute lwcc" bash -c "lwcc --version 2>&1 | grep '4.24'"
check "execute lwar" bash -c "lwar --version 2>&1 | grep '4.24'"
check "execute lwlink" bash -c "lwlink --version 2>&1 | grep '4.24'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
