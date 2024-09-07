# KABI_777 Recon Tool

## Description
KABI_777 is a powerful reconnaissance tool designed for security professionals and penetration testers. It automates the process of gathering subdomain information, checking HTTP status codes, and retrieving URLs, parameters, and JavaScript files from target domains. The tool also includes features for checking reflected parameters for potential vulnerabilities.

## Features
- **Subdomain Enumeration**: Uses tools like Sublist3r, Subfinder, and Assetfinder to gather subdomains.
- **HTTP Status Checking**: Checks the HTTP status codes of discovered subdomains.
- **URL Retrieval**: Fetches all URLs using `gau` and `waybackurls`.
- **Parameter Filtering**: Separates URLs with parameters and JavaScript files into different files.
- **Account Takeover Checks**: Uses Subzy to check for account takeover vulnerabilities.
- **Reflected Parameter Checking**: Utilizes Gxss to identify reflected parameters in URLs.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/kabi777/Torru.git
   
