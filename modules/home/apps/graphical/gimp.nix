{ lib, pkgs, osConfig, ... }:
{
  config = lib.mkIf osConfig.snow.graphical.gimp.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
