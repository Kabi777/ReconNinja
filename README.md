
# ReconNinja Tool

ReconNinja is a powerful reconnaissance tool designed for penetration testers and security researchers. It automates the collection of subdomains, URLs, and parameters from a target domain, helping users to identify potential vulnerabilities.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)


## Features
- Collects subdomains using `Sublist3r`, `Subfinder`, and `Assetfinder`.
- Checks HTTP status codes with `httpx`.
- Fetches URLs using `gau` and `waybackurls`.
- Performs Gxss checks on collected parameters.
- Outputs results into organized directories for easy access.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ReconNinja.git
   cd ReconNinja
   ```

2. Ensure you have the following tools installed:
   - `Sublist3r`
   - `Subfinder`
   - `Assetfinder`
   - `httpx`
   - `gau`
   - `waybackurls`
   - `Gxss`

3. Make the script executable:
   ```bash
   chmod +x recon_ninja.sh
   ```

## Usage
Run the script with the following command:
```bash
./recon_ninja.sh <domain> [-u] [-c] [-g]
```

### Arguments
- `<domain>`: The target domain to perform reconnaissance on.
- `-u`: Fetch main domain URLs and filter all URLs using `gau` and `waybackurls`.
- `-c`: Check all domains from `httpx_200.txt` with `gau` and `waybackurls`.
- `-g`: Perform Gxss check on parameters collected.

## Examples
- Run basic reconnaissance:
  ```bash
  ./recon_ninja.sh example.com
  ```
- Run reconnaissance and fetch URLs for the main domain:
  ```bash
  ./recon_ninja.sh example.com -u
  ```
- Fetch URLs for all domains from `httpx_200.txt`:
  ```bash
  ./recon_ninja.sh example.com -c
  ```
 - Perform Gxss check on collected parameters from main domain:
  ```bash
  ./recon_ninja.sh example.com -u -g
  ```

- Perform Gxss check on collected parameters from all domains:
  ```bash
  ./recon_ninja.sh example.com -c -g 
  ```
  

## Contributing
Contributions are welcome! Please create an issue or submit a pull request for any improvements or new features.

