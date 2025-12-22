!#usr/bin/env bash

distro="$(awk -F= '/^NAME/{print $2}' /etc/os-release)"

curl --output ~/.config/VSCodium/User/settings.json "https://raw.githubusercontent.com/mogggen/dotfiles/refs/heads/main/VSCodium/User/settings.json"
