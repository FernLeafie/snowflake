{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.rust.enable =
      lib.mkEnableOption "rust tooling" // {
        default = config.snow.tooling.enable;
      };
  };
  config = lib.mkIf config.snow.tooling.rust.enable {
    home.packages = with pkgs; [
      rust-analyzer-unwrapped
      cargo
    ];
    programs.nixvim = {
      snow.debugging = true;
      lsp.servers.rust_analyzer.enable = true;
    };
  };
}
