{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.tooling.python;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ruff
      uv
      pyright
      basedpyright
      python314
    ];
    programs.nixvim = {
      lsp.servers.basedpyright.enable = true;
      plugins.conform-nvim.settings.formatters_by_ft = {
        python = [
          "isort"
          "ruff"
        ];
      };
    };
  };
}
