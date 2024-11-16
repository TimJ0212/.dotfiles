{ config, pkgs, ... }:

{
  environment.etc."admin-pass".text = "admin";
  networking = {
    hostName = "homelab";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
        3000
        8096
      ];
      allowedUDPPorts = [ 53 ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

}
