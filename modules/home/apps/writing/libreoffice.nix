{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.writing.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice-qt
    ];
  };
}
