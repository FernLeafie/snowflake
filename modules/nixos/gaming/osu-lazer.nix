{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.gaming.osu-lazer.enable {
    home.packages = with pkgs; [
      osu-lazer
    ];
  };
}
