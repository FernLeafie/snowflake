{ config, pkgs, ... }:
{
  programs = {
    lsd.enable = true;
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
      ];
    };
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };
}
