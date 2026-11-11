{ lib, config, ... }:
let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkDefault mkIf mkMerge;

  cfg = config.snow;
  cfgprof = cfg.profiles;
in
{
  options.snow.profiles = {
    # main profiles
    desktop.enable = mkEnableOption "Desktop";
    laptop.enable = mkEnableOption "Laptop";
    server.enable = mkEnableOption "Server";
    entertainment.enable = mkDefault "Media box";

    # sub profiles
    headless.enable = mkEnableOption "Headless system";
    graphical.enable = mkEnableOption "Graphical system";
  };
}
