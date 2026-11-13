{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.modules) mkIf;
in
{
  config = mkIf config.snow.gaming.steam.enable {
    programs.steam = {
      enable = true;
      # Only switch package if millennium is enabled
      package = mkIf config.snow.gaming.steam.millennium.enable pkgs.steamWithMillennium;
      remotePlay.openFirewall = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = [
      pkgs.sgdboop
    ];
  };
}
