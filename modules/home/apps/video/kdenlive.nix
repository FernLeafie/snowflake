{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.video.kdenlive.enable {
    home.packages = with pkgs; [
      kdenlive
    ];
  };
}
