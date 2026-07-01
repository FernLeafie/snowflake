{ config, lib, pkgs, ... }:
{
  options = {
    snow.graphical.gimp.enable =
      lib.mkEnableOption "gimp" // {
        default = config.snow.graphical.enable;
      };
  };
  config = lib.mkIf config.snow.graphical.gimp.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
