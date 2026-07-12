{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "catppuccin-nvim";
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
        globalstatus = true;
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            icon = "";
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "filetype";
            coloured = true;
            icon_only = true;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "filename";
            separator = {
              __raw = "nil";
            };
            padding = {
              left = 0;
              right = 1;
            };
            symbols = {
              modified = " ";
              readonly = " ";
              unnamed = " ";
              newfile = " ";
            };
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            colored = true;
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "diagnostics";
            sources = [ "nvim_diagnostic" ];
            sections = [
              "error"
              "warn"
            ];
            symbols = {
              error = " ";
              warn = " ";
            };
            colored = true;
            always_visible = true;
            cond = {
              __raw = ''
                function()
                  return vim.bo.filetype ~= 'markdown'
                end
              '';
            };
          }
          "filetype"
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
      extensions = [
        "nvim-tree"
        "fern"
      ];
    };
  };
}
