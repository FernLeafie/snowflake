{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.python.enable {
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
