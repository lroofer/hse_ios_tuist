#!/bin/bash

# Check multiple common installation locations
if which swiftlint >/dev/null; then
    swiftlint --config .swiftlint.yml
elif [ -f /usr/local/bin/swiftlint ]; then
    /usr/local/bin/swiftlint --config .swiftlint.yml
elif [ -f /opt/homebrew/bin/swiftlint ]; then
    /opt/homebrew/bin/swiftlint --config .swiftlint.yml
else
    echo "warning: SwiftLint not installed or not found in PATH"
    echo "Install with: brew install swiftlint"
fi
