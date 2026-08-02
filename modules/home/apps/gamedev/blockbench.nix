{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.gamedev.blockbench.enable {
    home.packages = with pkgs; [
      blockbench
    ];
  };
}
