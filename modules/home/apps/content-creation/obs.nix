{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.content-creation.obs.enable {
    programs.obs-studio.enable = true;
  };
}
