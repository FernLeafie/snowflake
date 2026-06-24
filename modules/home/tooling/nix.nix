{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.nix.enable =
      lib.mkEnableOption "nix tooling";
  };
  config = lib.mkIf config.snow.tooling.nix.enable {
    home.packages = with pkgs; [
      nil
      nixfmt
    ];
  };
}
