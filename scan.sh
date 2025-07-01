#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Root check
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}[!] This script must be run as root. Use sudo.${NC}"
  exit 1
fi

echo -e "${CYAN}[*] Starting system scan for potential malware...${NC}"

# Suspicious patterns to scan for
suspicious_patterns=(
  "*.exe"
  "*.scr"
  "*.pif"
  "*.bat"
  "*.cmd"
  "*.vbs"
  "*.jar"
  "*.run"
  "*.bin"
  "*.out"
  "*hacktool*"
  "*keygen*"
  "*crack*"
)

# Directories to scan
scan_dirs=(
  /bin /boot /dev /etc /home /lib /opt /root /sbin /srv /tmp /usr /var
)

found_any=false

# Scan loop
for dir in "${scan_dirs[@]}"; do
  for pattern in "${suspicious_patterns[@]}"; do
    matches=$(find "$dir" -type f -iname "$pattern" 2>/dev/null)
    if [ -n "$matches" ]; then
      echo -e "${YELLOW}[!] Suspicious files found in ${dir} matching '${pattern}':${NC}"
      echo -e "${RED}$matches${NC}"
      found_any=true
    fi
  done
done

# Final message
if ! $found_any; then
  echo -e "${GREEN}[+] No suspicious files found. System appears clean.${NC}"
fi
