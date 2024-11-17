{ config, pkgs, ... }:

{

  home.packages = [
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
