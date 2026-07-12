{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.steam.enable {
    nixpkgs.overlays = [ inputs.millennium.overlays.default ];
    programs.steam = {
      enable = true;
      package = pkgs.millennium-steam;
      remotePlay.openFirewall = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = [
      pkgs.sgdboop
    ];
  };
}
