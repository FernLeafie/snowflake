{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.gamedev.aseprite.enable {
    home.packages = with pkgs; [
      aseprite
    ];
  };
}
