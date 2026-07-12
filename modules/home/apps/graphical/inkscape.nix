{ lib, pkgs, osConfig, ... }:
{
  config = lib.mkIf osConfig.snow.graphical.inkscape.enable {
    home.packages = with pkgs; [
      inkscape
    ];
  };
}
