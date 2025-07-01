# 🔍 scan – A Simple Linux Malware Scanner (Root Only)

`scan` is a lightweight, bash-based tool that scans your Linux system for potentially malicious files using filename pattern matching. It's designed to be fast, easy to use, and **only accessible to root users** for security purposes.

---

## ⚙️ Features

- ✅ Requires root (refuses to run otherwise)
- 🔍 Scans critical system directories
- 🧪 Detects:
  - Suspicious extensions like `.exe`, `.scr`, `.vbs`, etc.
  - Common malware-related keywords (`crack`, `keygen`, etc.)
- 🎨 Clean, color-coded output
- 🚫 No dependencies

---

## 🧰 Requirements

- Bash shell
- Linux system
- Root privileges

---

## 📦 Installation

```bash
# Clone this repository
git clone https://github.com/yourusername/scan-tool.git
cd scan-tool

# Install the scan command globally
sudo cp scan /usr/local/bin/scan
sudo chmod +x /usr/local/bin/scan

#Run the tool with 

sudo scan

#but remember to in root

