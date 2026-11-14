{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.snow.gaming.osu-lazer;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.osu-lazer-bin ];
  };
}
