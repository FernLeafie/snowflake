{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.gamedev.aseprite;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      aseprite
    ];
  };
}
