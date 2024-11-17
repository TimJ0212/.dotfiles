{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.localsend
  ];
}
