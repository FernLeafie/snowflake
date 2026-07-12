{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins.treesitter-context = {
    enable = true;
    settings = {
      mode = "topline";
      # [HACK] for some reason this doesnt work if declared in luaConfig
      on_attach = {
        __raw = ''
          function()
            vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg = "#9399b2" })
            vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { sp = "#45475a", underline = true, })
            return nil
          end
        '';
      };
    };
  };
}
