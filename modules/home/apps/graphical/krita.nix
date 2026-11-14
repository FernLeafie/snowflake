{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.graphical.krita;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      krita
    ];
  };
}
