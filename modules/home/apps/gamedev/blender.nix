{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.gamedev.blender;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      blender
    ];
  };
}
