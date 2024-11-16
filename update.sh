#!/bin/sh

# Function to prompt the user for confirmation
confirm() {
  local prompt="$1"
  local default="$2"

  if [ "$default" = "yes" ]; then
    read -p "$prompt [Y/n] " response
    response=${response:-yes}
  else
    read -p "$prompt [y/N] " response
    response=${response:-no}
  fi

  case $response in
    [Yy]* ) return 0 ;;
    * ) return 1 ;;
  esac
}

# Function to prompt the user for a choice
choose_config() {
  while true; do
    read -p "Use 'homelab' or 'nixos' configuration? " config
    case $config in
      homelab|nixos) break ;;
      *) echo "Invalid choice. Please enter 'homelab' or 'nixos'." ;;
    esac
  done
}

# Ask which configuration to use
choose_config

# Update nix flake
if confirm "Update nix flake?"; then
  nix flake update
else
  echo "Skipping nix flake update."
fi

# Rebuild nixos
if confirm "Rebuild nixos?"; then
  sudo nixos-rebuild switch --flake .#$config
else
  echo "Skipping nixos rebuild."
fi

# Switch home-manager
if confirm "Switch home-manager?"; then
  home-manager switch --flake .
else
  echo "Skipping home-manager switch."
fi

