
# KABI_777 RECON TOOL

KABI_777 is a reconnaissance tool designed to perform various subdomain and URL discovery tasks efficiently. It integrates several tools like Sublist3r, Subfinder, Assetfinder, HTTPX, and Gxss for a comprehensive reconnaissance process.

## Features

- Discover subdomains using Sublist3r, Subfinder, and Assetfinder.
- Check HTTP status codes of discovered subdomains.
- Fetch all URLs for the main domain using the `-u` flag.
- Check URLs from the `httpx_200.txt` file using the `-c` fla
- Filter for parameters and JavaScript files.
- Check for reflected parameters using Gxss.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/Torru.git
   ```
2. Change to the project directory:
   ```bash
   cd Torru
   ```
3. Make the script executable:
   ```bash
   chmod +x sub.sh
   ```

## Usage

To use the KABI_777 recon tool, run the following command:

```bash
./sub.sh <domain> [-u] [-c]
```

### Arguments

- `<domain>`: The target domain to perform reconnaissance on.
- `-u`: Fetch and filter all URLs for the main domain using gau and waybackurls.
- `-c`: Check all URLs from `httpx_200.txt` using gau and waybackurls.

### Examples

- Run basic reconnaissance:
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

## Output

Results are saved in a directory named `<domain>_recon_results`, with URLs saved in a separate `urls` subdirectory. 

### URL Results

When using the `-u` flag, all URLs for the main domain will be fetched and saved in the `urls/main_Domain_urls.txt` file. Additionally, parameters and JavaScript files will be filtered and saved in separate files:

- All URLs: `urls/main_Domain_urls.txt`
- Parameters: `urls/parameters.txt`
- JavaScript Files: `urls/js_files.txt`
- Reflected Parameters: `urls/reflected_parameters.txt`

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

```

### Notes:
- Replace `yourusername` with your actual GitHub username in the clone command.
- Make sure to update any additional sections as necessary based on your tool's functionality.
