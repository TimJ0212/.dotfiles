{
  description = "My first Flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./nixos-hardware-config.nix
            ./clients/nixos.nix
            ./mods/anki.nix
            ./mods/bash.nix
            ./mods/system.nix
            ./mods/thunderbird.nix
            ./mods/tmux.nix
            ./mods/wm.nix
          ];
        };
        homelab = lib.nixosSystem {
          inherit system;
          modules = [
            ./homelab-hardware-config.nix
            ./clients/homelab.nix
            ./mods/adguardhome.nix
            ./mods/bash.nix
            ./mods/jellyfin.nix
            ./mods/nextcloud.nix
            ./mods/paperless.nix
            ./mods/system.nix
            ./mods/tmux.nix
          ];
        };
      };
      homeConfigurations = {
        timj = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./mods/home/home.nix
            ./mods/home/alacritty.nix
            ./mods/firefox.nix
            ./mods/git.nix
            ./mods/joplin.nix
            ./mods/nvim.nix
          ];
        };
      };
    };
}
