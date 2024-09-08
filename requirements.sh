#!/bin/bash





# Install tools if not installed
echo "Checking and installing required tools..."

# Install Sublist3r
if ! command -v sublist3r &> /dev/null; then
    echo "Installing Sublist3r..."
    sudo apt-get install -y sublist3r
fi

# Install Subfinder
if ! command -v subfinder &> /dev/null; then
    echo "Installing Subfinder..."
    sudo apt-get install -y subfinder
fi

# Install Assetfinder
if ! command -v assetfinder &> /dev/null; then
    echo "Installing Assetfinder..."
    sudo apt-get install -y assetfinder
fi

# Install httpx
if ! command -v httpx &> /dev/null; then
    echo "Installing httpx..."
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
fi

# Install Gxss (for reflected XSS checks)
if ! command -v Gxss &> /dev/null; then
    echo "Installing Gxss..."
    go install -v github.com/KathanP19/Gxss@latest
fi

# Install Subzy (for subdomain takeover checks)
if ! command -v subzy &> /dev/null; then
    echo "Installing Subzy..."
    go install -v github.com/lukasikic/subzy@latest
fi

# Install jq for JSON processing
if ! command -v jq &> /dev/null; then
    echo "Installing jq..."
    sudo apt-get install -y jq
fi
echo "All tools are installed."
