{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.services.tailscale;
in
{
  config = mkIf cfg.enable {
    services = {
      tailscale-systray = {
        enable = true;
      };
    };
  };
}
