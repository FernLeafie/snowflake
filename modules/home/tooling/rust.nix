{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.tooling.rust;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rust-analyzer
      rustc
      cargo
    ];
    programs.nixvim = {
      snow.debugging = true;
      lsp.servers.rust_analyzer.enable = true;
    };
  };
}
