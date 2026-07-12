{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.typst.enable {
    home.packages = with pkgs; [
      typst
      tinymist
    ];
    programs.nixvim.lsp.servers.tinymist.enable = true;
  };
}
