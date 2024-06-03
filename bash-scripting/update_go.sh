#!/bin/bash

# Please note that this only for Linux-AMD64 OS Arch
# Get the latest Go version
go_latest_version=$(curl -s https://go.dev/VERSION?m=text | grep "go" | sed 's/go//')
printf "Latest Go version: %s\n" "${go_latest_version}"

# Get the current Go version
go_version=$(go version | grep go | awk '{print substr($3,3)}')
printf "Current Go version: %s\n" "${go_version}"

# Compare current and latest Go versions
if [ "$go_version" != "$go_latest_version" ]; then
    printf "Uninstalling and reinstalling latest Go version: %s\n" "${go_latest_version}"
    
    # Download the latest Go tarball
    curl -LO "https://golang.org/dl/go${go_latest_version}.linux-amd64.tar.gz"
    
    # Remove the old Go installation
    sudo rm -rf /usr/local/go
    
    # Extract the new Go tarball
    sudo tar -C /usr/local -xzf "go${go_latest_version}.linux-amd64.tar.gz"
    
    # Clean up the downloaded tarball
    rm "go${go_latest_version}.linux-amd64.tar.gz"
else
    printf "LATEST GO VERSION IS ALREADY INSTALLED!!!\n"
fi
