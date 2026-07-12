{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.rust.enable {
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
