{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.nix.enable {
    home.packages = with pkgs; [
      nixfmt
    ];
    programs.nixvim = {
      lsp.servers.nixd = {
        enable = true;
        config.settings.nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
          formatting.command = [ "nixfmt" ];
          options = {
            # [NOTE] documentation can be found at
            # https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md
            # incase flake parts integration is ever desired
            nixos.expr = "(builtins.getFlake (toString ./.)).nixosConfigurations.${osConfig.networking.hostName}.options";
            home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.${osConfig.networking.hostName}.options.home-manager.users.type.getSubOptions []";
          };
        };
      };
    };
  };
}
