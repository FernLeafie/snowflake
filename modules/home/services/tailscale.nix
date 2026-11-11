{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.services.tailscale.enable {
    services = {
      tailscale-systray = {
        enable = true;
      };
    };
  };
}
