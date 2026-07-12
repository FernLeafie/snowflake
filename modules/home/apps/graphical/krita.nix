{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.graphical.krita.enable {
    home.packages = with pkgs; [
      krita
    ];
  };
}
