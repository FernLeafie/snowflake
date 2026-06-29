{ config, lib, pkgs, ... }:
{
  options = {
    snow.video.kdenlive.enable =
      lib.mkEnableOption "kdenlive" // {
        default = config.snow.video.enable;
      };
  };
  config = lib.mkIf config.snow.video.kdenlive.enable {
    home.packages = with pkgs; [
      kdenlive
    ];
  };
}
