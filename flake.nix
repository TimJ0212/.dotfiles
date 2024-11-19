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
            ./system/bash.nix
            ./system/system.nix
            ./system/tmux.nix
            ./system/wm.nix
            ./system/apps/gnome-boxes.nix
            ./system/apps/kde-connect.nix
            ./system/apps/localsend.nix
            ./system/apps/metadata-cleaner.nix
            ./system/apps/okular.nix
          ];
        };
        homelab = lib.nixosSystem {
          inherit system;
          modules = [
            ./homelab-hardware-config.nix
            ./clients/homelab.nix
            ./system/apps/homepage-dashboard.nix
            ./system/adguardhome.nix
            ./system/bash.nix
            ./system/jellyfin.nix
            ./system/nextcloud.nix
            ./system/paperless.nix
            ./system/system.nix
            ./system/tmux.nix
          ];
        };
      };
      homeConfigurations = {
        timj = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/apps/anki.nix
            ./home/apps/firefox.nix
            ./home/apps/joplin.nix
            ./home/apps/thunderbird.nix
            ./home/apps/intellij.nix
            ./home/cli/alacritty.nix
            ./home/cli/git.nix
            ./home/cli/nvim.nix
            ./home/cli/zsh.nix
            ./home/home.nix
          ];
        };
      };
    };
}
