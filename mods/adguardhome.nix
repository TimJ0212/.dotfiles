{ config, pkgs, ... }:

{

  services.adguardhome = {
    enable = true;
    openFirewall = true;
    port = 3000;
  };

  services.nginx = {
    enable = true;
    virtualHosts."adguard.local" = {
      locations."/" = {
        proxyPass = "http://localhost:3000";
      };
    };
  };
}
