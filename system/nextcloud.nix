{ config, pkgs, ... }:

{
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.local";
    package = pkgs.nextcloud30;
    config = {
      adminpassFile = "/etc/admin-pass";
    };
    settings = {
      trusted_domains = [ "nextcloud.local", "192.168.172.48" ];
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts."nextcloud.local" = {
      locations."/" = {
        proxyPass = "http://localhost:80";
      };
    };
  };
}
