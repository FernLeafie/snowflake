{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
          icon = "󰓩 ";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code actions";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Debug and diagnostics";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find files";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Lsp actions";
          icon = {
            icon = "";
            color = "green";
          };
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Tabs";
          icon = {
            icon = "󰓩 ";
            color = "purple";
          };
        }
      ];
    };
  };
  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>?";
      action = {
        __raw = ''
          function()
            require('which-key').show({ global = false })
          end
        '';
      };
      options.desc = "Buffer Local keymap hint";
    }
  ];
}
