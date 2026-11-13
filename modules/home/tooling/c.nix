{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.c.enable {
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
