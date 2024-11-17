{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Tim Jungk";
    userEmail = "tim.jungk@gmx.de";
  };
}
