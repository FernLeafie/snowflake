{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.content-creation.audacity;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      audacity
    ];
  };
}
