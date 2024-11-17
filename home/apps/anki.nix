{ config, pkgs, ... }:
{

  home.packages = [
    pkgs.anki-bin
    pkgs.mpv # Anki Sound
  ];
}
