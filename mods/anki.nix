{ config, pkgs, ... }:
{

  environment.systemPackages = [
    pkgs.anki-bin
    pkgs.mpv # Anki Sound
  ];
}
