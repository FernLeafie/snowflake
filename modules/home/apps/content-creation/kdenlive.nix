{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.content-creation.kdenlive;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      kdePackages.kdenlive
    ];
  };
}
