{ config, lib, pkgs, ... }:
{
  options = {
    snow.video.obs.enable =
      lib.mkEnableOption "obs-studio" // {
        default = config.snow.video.enable;
      };
  };
  config = lib.mkIf config.snow.video.obs.enable {
    programs.obs-studio.enable = true;
  };
}
