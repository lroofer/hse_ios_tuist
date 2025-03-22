#!/bin/bash

# Check if Tuist is installed
if ! command -v tuist &> /dev/null; then
    echo "Tuist not found. Installing with Homebrew..."

    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew first."
        echo "Visit https://brew.sh for installation instructions."
        exit 1
    fi

    # Install Tuist
    brew install tuist

    # Verify installation was successful
    if ! command -v tuist &> /dev/null; then
        echo "Failed to install Tuist. Please install it manually."
        exit 1
    fi

    echo "Tuist installed successfully."
else
    echo "Tuist is already installed."
fi

# Run Tuist with specified config
echo "Running Tuist..."
tuist install
tuist generate
