{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.metadata-cleaner
  ];
}
