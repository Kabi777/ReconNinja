#!/bin/bash
# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Enhanced Banner with Color and Bigger Size
echo -e "${RED}*********************************************${RESET}"
echo -e "${GREEN}*${RESET} ${CYAN}██████╗ ███████╗ ██████╗ ██╗   ██╗██████╗ ${RESET} ${GREEN}*${RESET}"
echo -e "${GREEN}*${RESET} ${CYAN}██╔══██╗██╔════╝██╔═══██╗██║   ██║██╔══██╗${RESET} ${GREEN}*${RESET}"
echo -e "${GREEN}*${RESET} ${CYAN}██████╔╝█████╗  ██║   ██║██║   ██║██████╔╝${RESET} ${GREEN}*${RESET}"
echo -e "${GREEN}*${RESET} ${CYAN}██╔══██╗██╔══╝  ██║   ██║██║   ██║██╔═══╝ ${RESET} ${GREEN}*${RESET}"
echo -e "${GREEN}*${RESET} ${CYAN}██║  ██║███████╗╚██████╔╝╚██████╔╝██║     ${RESET} ${GREEN}*${RESET}"
echo -e "${GREEN}*${RESET} ${CYAN}╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ${RESET} ${GREEN}*${RESET}"
echo -e "${RED}*********************************************${RESET}"
echo -e "${CYAN}                RECONNINJA TOOL v1.0                ${RESET}"
echo -e "${CYAN}                Developed by KABI_777                 ${RESET}"
echo -e "${RED}*********************************************${RESET}"

# Check if the target domain is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Usage: $0 <domain> [-u] [-c]${RESET}"
    echo ""
    echo -e "${GREEN}Arguments:${RESET}"
    echo "  <domain>  The target domain to perform reconnaissance on."
    echo "  -u        Fetch main domain urls and filter all URLs using gau and waybackurls."
    echo "  -c        Check all domain from httpx_200.txt with gau and waybackurls."
    echo ""
    echo -e "${CYAN}Examples:${RESET}"
    echo "  $0 example.com            # Run basic reconnaissance."
    echo "  $0 example.com -u         # Run reconnaissance and fetch urls for main domain"
    echo "  $0 example.com -c         # fetch URLs for all domains from httpx_200.txt."
    exit 1
fi

TARGET_DOMAIN=$1
URL_FLAG=$2
CHECK_FLAG=$3

# Create a directory for the results using the domain name
mkdir -p "${TARGET_DOMAIN}_recon_results"
cd "${TARGET_DOMAIN}_recon_results" || exit

# Create a directory for URLs
mkdir -p "urls"

# Step 1: Sublist3r
echo -e "${GREEN}[*] Running Sublist3r...${RESET}"
sublist3r -d "$TARGET_DOMAIN" -o sublist3r_results.txt

# Step 2: Subfinder
echo -e "${GREEN}[*] Running Subfinder...${RESET}"
subfinder -d "$TARGET_DOMAIN" -o subfinder_results.txt

# Step 3: Assetfinder
echo -e "${GREEN}[*] Running Assetfinder...${RESET}"
assetfinder --subs-only "$TARGET_DOMAIN" > assetfinder_results.txt

# Step 4: Combine results and filter unique entries
echo -e "${GREEN}[*] Combining results...${RESET}"
cat sublist3r_results.txt subfinder_results.txt assetfinder_results.txt | \
sort -u > all_unique_subdomains.txt

# Step 5: Use httpx to check HTTP status and get titles
echo -e "${GREEN}[*] Checking HTTP status...${RESET}"
httpx -l all_unique_subdomains.txt -o httpx_results.txt -status-code

# Step 6: Separate results into a file for 200 status codes
echo -e "${GREEN}[*] Saving 200 status codes...${RESET}"
grep "200" httpx_results.txt | cut -d ' ' -f 1 > httpx_200.txt

# Step 7: Use Subzy for account takeover checks
echo -e "${GREEN}[*] Running Subzy for account takeover checks...${RESET}"
subzy run --targets all_unique_subdomains.txt | tee subzy_results.txt

# Step 8: Check for URLs if the flag is provided
if [ "$URL_FLAG" == "-u" ]; then
    echo -e "${GREEN}[*] Fetching all URLs using gau and waybackurls...${RESET}"

    # Use gau to get all URLs
    gau "$TARGET_DOMAIN" | waybackurls "$TARGET_DOMAIN" | sort -u >urls/main_Domain_urls.txt

    # Separate URLs into different files
    echo -e "${GREEN}[*] Separating URLs into different files...${RESET}"
    grep "\?" urls/main_Domain_urls.txt > urls/parameters.txt   # Filter for parameters
    grep "\.js" urls/main_Domain_urls.txt > urls/js_files.txt   # Filter for JS files

    # Gxss to check for reflected parameters
    echo -e "${GREEN}[*] Checking for reflected parameters using Gxss...${RESET}"
    cat urls/parameters.txt | Gxss | tee urls/reflected_parameters.txt

    echo -e "${GREEN}[*] Results saved in urls directory:${RESET}"
    echo " - All URLs: urls/main_Domain_urls.txt"
    echo " - Parameters: urls/parameters.txt"
    echo " - JS Files: urls/js_files.txt"
    echo " - Reflected Parameters: urls/reflected_parameters.txt"
fi

# Step 9: Check URLs from httpx_200.txt using gau and waybackurls if the check flag is provided
if [ "$CHECK_FLAG" == "-c" ] || [ "$URL_FLAG" == "-c" ]; then
    echo -e "${GREEN}[*] Checking URLs in httpx_200.txt with gau and waybackurls...${RESET}"

    # Initialize output files
    > urls/gau_results.txt
    > urls/waybackurls_results.txt
    > urls/parameters_for_all_domains.txt
    > urls/js_files_for_all_domains.txt

    while read -r url; do
        gau "$url" >> urls/gau_results.txt
        waybackurls "$url" >> urls/waybackurls_results.txt
    done < httpx_200.txt

    # Combine and filter results
    cat urls/waybackurls_results.txt urls/gau_results.txt | sort -u > urls/all_domains_urls.txt

    # Separate parameters and JS files from combined URLs
    grep "\?" urls/all_domains_urls.txt > urls/parameters_for_all_domains.txt   # Filter for parameters
    grep "\.js" urls/all_domains_urls.txt >  urls/js_files_for_all_domains.txt   # Filter for JS files

    # Gxss to check for reflected parameters
    echo -e "${GREEN}[*] Checking for reflected parameters using Gxss...${RESET}"
    cat urls/parameters_for_all_domains.txt | Gxss >  urls/reflected_parameters_from_check.txt

    echo -e "${GREEN}[*] Results saved in urls directory:${RESET}"
    echo " - All URLs: urls/all_domains_urls.txt"
    echo " - Gau results: urls/gau_results.txt"
    echo " - Waybackurls results: urls/waybackurls_results.txt"
    echo " - Parameters from check: urls/parameters_for_all_domains.txt"
    echo " - JS Files from check: urls/js_files_for_all_domains.txt"
    echo " - Reflected Parameters: urls/reflected_parameters_from_check.txt"
fi

echo -e "${GREEN}[*] All results saved in ${TARGET_DOMAIN}_recon_results${RESET}"
