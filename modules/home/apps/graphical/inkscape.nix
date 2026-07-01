{ config, lib, pkgs, ... }:
{
  options = {
    snow.graphical.inkscape.enable =
      lib.mkEnableOption "inkscape" // {
        default = config.snow.graphical.enable;
      };
  };
  config = lib.mkIf config.snow.graphical.inkscape.enable {
    home.packages = with pkgs; [
      inkscape
    ];
  };
}
