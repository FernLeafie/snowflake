{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.graphical.inkscape;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      inkscape
    ];
  };
}
