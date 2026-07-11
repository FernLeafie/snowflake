{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.nix.enable =
      lib.mkEnableOption "nix tooling" // {
        default = config.snow.tooling.enable;
      };
  };
  config = lib.mkIf config.snow.tooling.nix.enable {
    home.packages = with pkgs; [
      # nil
      nixfmt
    ];
    programs.nixvim = {
      lsp.servers.nixd.enable = true;
    };
  };
}
