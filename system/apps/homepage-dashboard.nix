{ config, pkgs, ... }:

{
  services.homepage-dashboard = {
    settings = {
      title = "Mein Dashboard";
      language = "de";
    };

    services = [
      {
        Medien = [
          {
            Jellyfin = {
              icon = "jellyfin.png";
              href = "http://jellyfin.local";
              description = "Medienserver";
            };
          }
        ];
      }
      {
        Dokumente = [
          {
            Paperless = {
              icon = "paperless.png";
              href = "http://paperless.local";
              description = "Dokumentenverwaltung";
            };
          }
        ];
      }
      {
        Netzwerk = [
          {
            AdGuard = {
              icon = "adguard.png";
              href = "http://adguard.local";
              description = "Netzwerk-Werbeblocker";
            };
          }
          {
            FritzBox = {
              icon = "fritzbox.png";
              href = "http://fritz.box";
              description = "Router-Verwaltung";
            };
          }
        ];
      }
      {
        Cloud = [
          {
            Nextcloud = {
              icon = "nextcloud.png";
              href = "http://nextcloud.local";
              description = "Persönliche Cloud";
            };
          }
        ];
      }
    ];

    widgets = [
      {
        resources = {
          cpu = true;
          memory = true;
          disk = "/";
        };
      }
      {
        search = {
          provider = "duckduckgo";
        };
      }
      {
        datetime = {
          format = {
            dateStyle = "short";
            timeStyle = "short";
            locale = "de";
          };
        };
      }
    ];
  };
}
