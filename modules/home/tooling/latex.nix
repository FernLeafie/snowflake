{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.tooling.latex;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tectonic
    ];
    programs.nixvim = {
      lsp.servers.texlab.enable = true;
    };
  };
}
