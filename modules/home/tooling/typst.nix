{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.tooling.typst;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      typst
      tinymist
    ];
    programs.nixvim.lsp.servers.tinymist.enable = true;
  };
}
