{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.writing.libreoffice;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
    ];
  };
}
