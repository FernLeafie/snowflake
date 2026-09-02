{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.content-creation.kdenlive.enable {
    home.packages = with pkgs; [
      kdePackages.kdenlive
    ];
  };
}
