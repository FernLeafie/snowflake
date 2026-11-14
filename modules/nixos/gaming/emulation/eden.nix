{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.snow.gaming.emulation.eden;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.eden ];
  };
}
