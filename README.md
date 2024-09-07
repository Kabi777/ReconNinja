

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
   git clone https://github.com/yourusername/Torru.git
   cd Toruu
   ```

2. **Install required tools**: Ensure you have the following tools installed:
   - `Sublist3r`
   - `Subfinder`
   - `Assetfinder`
   - `httpx`
   - `gau`
   - `waybackurls`
   - `Subzy`
   - `Gxss`

3. **Make the script executable**:
   ```bash
   chmod +x sub.sh
   ```

## Usage
Run the tool with the following syntax:
```bash
./sub.sh <domain> [-u] [-c]
```

### Arguments
- `<domain>`: The target domain to perform reconnaissance on.
- `-u`: Fetch and filter all URLs using `gau` and `waybackurls`.
- `-c`: Check all URLs from `httpx_200.txt` with `gau` and `waybackurls`.

### Examples
- Basic reconnaissance:
  ```bash
  ./sub.sh example.com
  ```
- Run reconnaissance and fetch URLs:
  ```bash
  ./sub.sh example.com -u
  ```
- Check URLs from `httpx_200.txt`:
  ```bash
  ./sub.sh example.com -c
  ```
- Run reconnaissance, fetch URLs, and check them:
  ```bash
  ./sub.sh example.com -u -c
  ```

## Results
All results will be saved in a directory named `<domain>_recon_results`, with URL-related results stored in a separate `urls` directory. 

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## Author
KABI_777
```

Feel free to modify any sections to better fit your tool or personal style!￼Enter
