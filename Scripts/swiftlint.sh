#!/bin/bash

# Check if SwiftLint is installed
if ! command -v swiftlint &> /dev/null; then
    echo "SwiftLint not found"
else
    swiftlint --config .swiftlint.yml
fi
