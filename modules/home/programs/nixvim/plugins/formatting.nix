{ config, lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      formatters_by_ft = {
        css = { __unkeyed-1 = "prettierd"; __unkeyed-2 = "prettier"; stop_after_first = true; };
        javascript = { __unkeyed-1 = "prettierd"; __unkeyed-2 = "prettier"; stop_after_first = true; };
        json = { __unkeyed-1 = "prettierd"; __unkeyed-2 = "prettier"; stop_after_first = true; };
        lua = [ "stylua" ];
        rust = [ "rustfmt" ];
        yaml = [ "yamlfix" ];
        toml = [ "taplo" ];
      };
    };
  };
  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<leader>gf";
      action = {
        __raw = ''
          function()
          	require('conform').format({
          		lsp_format = 'fallback',
          		async = true,
          		timeout_ms = 1000,
          	})
          end
        '';
      };
      options.desc = "Format file or range";
    }
  ];
}
