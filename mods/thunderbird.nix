{ config, pkgs, ... }:
{

  environment.systemPackages = [
    pkgs.thunderbird
  ];
}
