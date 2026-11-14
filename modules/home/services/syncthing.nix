{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.user-services.syncthing;
in
{
  config = mkIf cfg.enable {
    services = {
      syncthing = {
        enable = true;
        overrideDevices = false;
        overrideFolders = false;
      };
    };
  };
}
