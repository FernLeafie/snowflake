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

  config.snow = mkMerge [
    {
      profiles = {
        # If server, normally headless
        headless.enable = mkIf (cfgprof.server.enable == true) mkDefault true;
        # If laptop or desktop, normally graphical
        graphical.enable = mkIf (
          cfgprof.laptop.enable == true || cfgprof.desktop.enable == true
        ) mkDefault true;
      };
    }
    (mkIf (cfgprof.laptop.enable == true || cfgprof.desktop.enable == true) {
      user-services.enable = mkDefault true;
      writing.enable = mkDefault true;
    })
    (mkIf
      (cfgprof.laptop.enable == true || cfgprof.desktop.enable == true || cfgprof.server.enable == true)
      {
        services.tailscale.enable = mkDefault true;
      }
    )
  ];
}
