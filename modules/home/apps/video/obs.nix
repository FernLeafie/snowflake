{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.video.obs.enable {
    programs.obs-studio.enable = true;
  };
}
