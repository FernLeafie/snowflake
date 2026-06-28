{ inputs, config, lib, pkgs, ... }:
{
  options = {
    snow.gaming.star-citizen.enable =
      lib.mkEnableOption "steam" // {
        default = false;
      };
  };
  config = lib.mkIf config.snow.gaming.star-citizen.enable {
    environment.systemPackages = with pkgs; [
      inputs.nix-citizen.packages.${system}.rsi-launcher
    ];
  };
}

