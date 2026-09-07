{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.latex.enable {
    home.packages = with pkgs; [
      tectonic
    ];
    programs.nixvim = {
      lsp.servers.texlab.enable = true;
    };
  };
}
