{ config, lib, pkgs, ... }:
{
  options = {
    snow.graphical.krita.enable =
      lib.mkEnableOption "krita" // {
        default = config.snow.graphical.enable;
      };
  };
  config = lib.mkIf config.snow.graphical.krita.enable {
    home.packages = with pkgs; [
      krita
    ];
  };
}
