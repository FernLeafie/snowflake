{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.snow.user-services.kdeconnect;
in
{
  config = mkIf cfg.enable {
    programs.kdeconnect.enable = true;
  };
}
