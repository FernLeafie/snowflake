{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.content-creation.obs;
in
{
  config = mkIf cfg.enable {
    programs.obs-studio.enable = true;
  };
}
