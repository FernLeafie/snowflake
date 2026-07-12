{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.user-services.syncthing.enable {
    services = {
      syncthing = {
        enable = true;
        overrideDevices = false;
        overrideFolders = false;
      };
    };
  };
}
