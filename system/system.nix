{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure console keymap
  console.keyMap = "de";

  users.users.timj = {
    isNormalUser = true;
    description = "Tim";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # programs.readline = {
  #  enable = true;
  # extraConfig = "\"\\e[A\": history-search-backward\n\"\\e[B\": history-search-forward";
  #};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.htop.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "24.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
