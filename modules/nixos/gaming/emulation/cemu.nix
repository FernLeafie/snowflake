{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.snow.gaming.emulation.cemu;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.cemu ];
  };
}
