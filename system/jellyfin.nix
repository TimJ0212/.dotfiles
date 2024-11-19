{ config, pkgs, ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    dataDir = "/media/data/jellyfin";
  };

  services.nginx = {
    enable = true;
    virtualHosts."jellyfin.local" = {
      locations."/" = {
        proxyPass = "http://localhost:8096";
      };
    };
  };
}
