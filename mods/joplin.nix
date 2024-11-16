{ config, pkgs, ... }:

{

  environment.systemPackages = [
    pkgs.joplin-desktop
  ];

  programs.joplin-desktop = {
    enable = true;
    sync = {
      target = "dropbox";
    };
    extraConfig = {

    };
  };
}
