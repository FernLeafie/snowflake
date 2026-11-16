{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (lib.meta) getExe;
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
      plugins = {
        code-runner-nvim.settings.filetype.c = [
          "cd $dir &&"
          "${getExe pkgs.clang} $fileName -o /tmp/$fileNameWithoutExt &&"
          "/tmp/$fileNameWithoutExt"
        ];
        conform-nvim.settings.formatters_by_ft.c = [
          "clang-format"
        ];
      };
    };
  };
}
