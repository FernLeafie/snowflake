{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.tooling.c;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      clang
      man-pages
      man-pages-posix
    ];
    programs.nixvim = {
      lsp.servers.clangd.enable = true;
      plugins.conform-nvim.settings.formatters_by_ft = {
        c = [
          "clang-format"
        ];
      };
    };
  };
}
