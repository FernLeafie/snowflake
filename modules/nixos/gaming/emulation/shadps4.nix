{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.snow.gaming.emulation.shadps4;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.shadps4 ];
  };
}
