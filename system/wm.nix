{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };
  services.xserver.excludePackages = [ pkgs.xterm ];

  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-photos
      gnome-tour
      gedit # text editor
      gnome-calendar
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-weather
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      gnome-terminal
    ]
  );

  programs.geary.enable = false;
}
