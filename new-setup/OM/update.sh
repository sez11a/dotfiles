#!/bin/bash

echo -e "\033[0;31m╔════════════════════════════════╗\033[0m" # Red for root.
echo -e "\033[0;31m║**Updating all System packages**║\033[0m" # Red for root.
echo -e "\033[0;31m╚════════════════════════════════╝\033[0m" # Red for root.
echo
sudo dnf clean all ; dnf clean all ; sudo dnf distro-sync --refresh --allowerasing 2>&1| tee dsync2-log.txt
echo
echo -e "\033[0;33m╔══════════════════════════════════╗\033[0m" # Yellow for user
echo -e "\033[0;33m║**Updating Flatpaks from FlatHub**║\033[0m" # Yellow for user
echo -e "\033[0;33m╚══════════════════════════════════╝\033[0m" # Yellow for user
echo
flatpak update # Flatpaks are not installed as root.
echo
echo -e "\033[0;32m╔═════════════════════╗\033[0m" # Green for complete
echo -e "\033[0;32m║**Script Completed!**║\033[0m" # Green for complete
echo -e "\033[0;32m╚═════════════════════╝\033[0m" # Green for complete
echo