{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  plugins = {
    lspconfig.enable = true;
    fidget = {
      enable = true;
      settings = {
        # [WARN] somehow fails to load if present
        # notification.window.avoid = [ "NvimTree" ];
      };
    };
  };

  lsp.servers = {
    harper_ls = {
      enable = true;
      config = {
        settings = {
          "harper-ls" = {
            linters = {
              SentenceCapitalization = false;
            };
            dialect = "British";
          };
        };
      };
    };
  };
  keymaps = [
    {
      mode = [ "n" ];
      key = "K";
      action.__raw = ''
        function()
        	vim.lsp.buf.hover({ border = 'rounded' })
        end
      '';
      options.desc = "Show LSP hover information";
    }

    {
      mode = [ "n" ];
      key = "<leader>gs";
      action.__raw = "vim.lsp.buf.rename";
      options.desc = "Rename variable across workspace, concider :wa";
    }
    {
      mode = [ "n" ];
      key = "<leader>gh";
      action.__raw = ''
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
      '';
      options.desc = "Toggle inline hints";
    }
  ];
}
