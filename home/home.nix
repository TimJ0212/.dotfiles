{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.username = "timj";
  home.homeDirectory = "/home/timj";

  home.sessionVariables = {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
