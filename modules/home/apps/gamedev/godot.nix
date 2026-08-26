{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.gamedev.godot.enable {
    home.packages = with pkgs; [
      godot
    ];
  };
}
