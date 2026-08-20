{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.gamedev.blender.enable {
    home.packages = with pkgs; [
      blender
    ];
  };
}
