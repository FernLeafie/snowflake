{ lib, pkgs, osConfig, ... }:
{
  config = lib.mkIf osConfig.snow.tooling.nix.enable {
    home.packages = with pkgs; [
      # nil
      nixfmt
    ];
    programs.nixvim = {
      lsp.servers.nixd.enable = true;
    };
  };
}
