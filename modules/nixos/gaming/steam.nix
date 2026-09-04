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
    # Only enable if millennium is enabled
    nixpkgs.overlays = mkIf config.snow.gaming.steam.millennium.enable [
      inputs.millennium.overlays.default
    ];
    programs.steam = {
      enable = true;
      # Only switch package if millennium is enabled
      package = mkIf config.snow.gaming.steam.millennium.enable pkgs.millennium-steam;
      remotePlay.openFirewall = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = [
      pkgs.sgdboop
    ];
  };
}
