{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.stirling-pdf ];
}
