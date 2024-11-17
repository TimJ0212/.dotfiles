{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-intel" ];
  environment.systemPackages = [
    pkgs.gnome-boxes
  ];
}
