{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.content-creation.audacity.enable {
    home.packages = with pkgs; [
      audacity
    ];
  };
}
