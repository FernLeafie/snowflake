{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins.tiny-inline-diagnostic = {
    enable = true;
    settings = {
      hi = {
        error = "DiagnosticError";
        warn = "DiagnosticWarn";
        info = "DiagnosticInfo";
        hint = "DiagnosticHint";
        arrow = "NonText";
        background = "CursorLine";
        mixing_color = "None";
      };
      options = {
        multilines = {
          enabled = true;
          always_show = true;
          # severity = [
          #   { __raw = ''vim.diagnostic.severity.ERROR''; }
          #   { __raw = ''vim.diagnostic.severity.WARN''; }
          # ];
        };
        add_messages = {
          display_count = true;
        };
      };
    };
  };
  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>de";
      action.__raw = ''
        function()
          require("tiny-inline-diagnostic").toggle()
        end
      '';
      options.desc = "Toggle diagnostics";
    }
  ];
  diagnostic.settings = {
    virtual_text = false;
    underline = true;
    signs = {
      text = [
        {
          __raw = ''
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          '';
        }
      ];
      numhl = [
        {
          __raw = ''
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
          '';
        }
      ];
    };
  };

}
