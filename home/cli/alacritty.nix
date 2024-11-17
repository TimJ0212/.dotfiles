{
  config,
  pkgs,
  lib,
  ...
}:

{

  home.packages = [
    pkgs.alacritty
    (pkgs.nerdfonts.override { fonts = [ "0xProto" ]; })
  ];

  fonts.fontconfig.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = lib.mkForce 0.85;
      font.normal = {
        family = "0xProto Nerd Font";
        style = "Regular";
      };
    };
  };

}
