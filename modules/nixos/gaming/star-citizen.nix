{ inputs, config, lib, pkgs, ... }:
{
  config = lib.mkIf config.snow.gaming.star-citizen.enable {
    environment.systemPackages = with pkgs; [
      inputs.nix-citizen.packages.${system}.rsi-launcher
    ];
  };
}

