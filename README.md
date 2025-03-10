# Shell Scripting Toolkit

A collection of handy shell scripts designed to automate everyday tasks—from checking disk usage to managing Docker resources and more. Whether you're a system administrator or a developer, these scripts can help streamline your workflow.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/yourusername/yourrepo.svg)](https://github.com/yourusername/yourrepo/issues)
[![GitHub stars](https://img.shields.io/github/stars/yourusername/yourrepo.svg)](https://github.com/yourusername/yourrepo/stargazers)

---

## Table of Contents

- [Overview](#overview)
- [Scripts](#scripts)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

This repository hosts a suite of shell scripts that aim to simplify routine maintenance tasks:

- **DiskUsage.sh**: Quickly assess your disk space and pinpoint storage hogs.
- **Docker_CleanUp.sh**: Easily remove unused Docker containers, images, and volumes to free up system resources.
- **NetworkCheck.sh**: Run network diagnostics and log output to help troubleshoot connectivity issues.
- **PasswordGenerator.sh**: Generate secure, random passwords for your applications or systems.
- **RotationalBackup.sh**: Create a rotational backup system that automates regular backups while managing old versions.
- **bashCheatSheet.sh**: A quick reference guide featuring common bash commands and scripting tips.
- **network_check_output.txt**: Sample output from `NetworkCheck.sh` for reference.

---

## Scripts

### DiskUsage.sh
Analyzes disk space usage, helping you quickly identify files or directories that are consuming the most space.

### Docker_CleanUp.sh
Automates the cleanup of Docker resources. Perfect for developers looking to keep their Docker environment tidy.

### NetworkCheck.sh
Checks network connectivity and outputs detailed status information. Great for troubleshooting network issues.

### PasswordGenerator.sh
Generates strong, random passwords to enhance your system's security.

### RotationalBackup.sh
Implements a rotational backup strategy, ensuring that you always have recent backups while archiving older ones.

### bashCheatSheet.sh
Provides a concise cheat sheet for commonly used bash commands—a handy reference for both beginners and experts.

### network_check_output.txt
An example file showing the output format of the network check script, useful for understanding expected results.

---

## Usage

Before running any of the scripts, ensure they have the proper execution permissions:

```bash
chmod +x DiskUsage.sh Docker_CleanUp.sh NetworkCheck.sh PasswordGenerator.sh RotationalBackup.sh bashCheatSheet.sh


You can then execute any script by running, for example:

```bash
./DiskUsage.sh
```

---

## Contributing

Contributions are welcome! If you have ideas for new scripts, improvements, or bug fixes, please:

1. Fork the repository.
2. Create a new branch for your feature or fix.
3. Commit your changes and open a pull request.

For any issues or questions, please open an issue in the [GitHub Issues](https://github.com/yourusername/yourrepo/issues) section.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
