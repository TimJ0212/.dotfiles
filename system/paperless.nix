{ config, pkgs, ... }:

{
  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    port = 28981;
    consumptionDirIsPublic = true;
    settings  = {
      PAPERLESS_URL="http://paperless.local";
      PAPERLESS_CONSUMER_IGNORE_PATTERN = [
        ".DS_STORE/*"
        "desktop.ini"
      ];
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      PAPERLESS_OCR_USER_ARGS = {
        optimize = 1;
        pdfa_image_compression = "lossless";
      };
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts."paperless.local" = {
      locations."/" = {
        proxyPass = "http://localhost:28981";
      };
    };
  };
}
