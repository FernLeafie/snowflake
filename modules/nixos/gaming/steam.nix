{ inputs, config, lib, pkgs, ... }:
{
  options = {
    snow.gaming.steam.enable =
      lib.mkEnableOption "steam" // {
        default = config.snow.gaming.enable;
      };
  };
  config = lib.mkIf config.snow.gaming.steam.enable {
    nixpkgs.overlays = [ inputs.millennium.overlays.default ];
    programs.steam = {
      enable = true;
      package = pkgs.millennium-steam;
      remotePlay.openFirewall = true;
    };
    programs.gamemode.enable = true;
  };
}

