{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    telescope = {
      enable = true;
      settings = {
        extensions = {
          "ui-select" = {
            __unkeyed-1.__raw = ''require("telescope.themes").get_dropdown({})'';
          };
        };
      };
      extensions.ui-select.enable = true;
    };
    
    tiny-code-action-nvim = {
      enable = true;
      settings = {
        backend = "delta";
        picker = "telescope";
        backend_opts = {
          delta = {
            header_lines_to_remove = 4;
            args = [
              "--line-numbers"
            ];
          };
        };
      };
    };
  };

  keymaps = [
    # text and files
    {
      mode = [ "n" ];
      key = "<leader>ff";
      action.__raw = "require('telescope.builtin').find_files";
      options.desc = "Find files";
    }
    {
      mode = [ "n" ];
      key = "<leader>fg";
      action.__raw = "require('telescope.builtin').live_grep";
      options.desc = "Grep in files";
    }
    {
      mode = [ "n" ];
      key = "<leader>fo";
      action.__raw = "require('telescope.builtin').oldfiles";
      options.desc = "Find old files";
    }
    {
      mode = [ "n" ];
      key = "<leader>f/";
      action.__raw = ''
        function()
        	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        		winblend = 10,
        		previewer = false,
        		layout_config = { width = 0.7 },
        	}))
        end
      '';
      options.desc = "Fuzzy find in current buffer";
    }
    # Lsp menus
    {
      mode = [ "n" ];
      key = "<leader>gd";
      action.__raw = "require('telescope.builtin').lsp_definitions";
      options.desc = "Show LSP definitions";
    }
    {
      mode = [ "n" ];
      key = "<leader>gr";
      action.__raw = "require('telescope.builtin').lsp_references";
      options.desc = "Show LSP references";
    }
    {
      mode = [ "n" ];
      key = "<leader>gi";
      action.__raw = "require('telescope.builtin').lsp_implementations";
      options.desc = "Go to implementatation";
    }
    {
      mode = [ "n" ];
      key = "<leader>ds";
      action.__raw = "require('telescope.builtin').diagnostics";
      options.desc = "Show LSP diagnostics";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ca";
      action.__raw = "require('tiny-code-action').code_action";
      options.desc = "Show code actions";
    }
  ];
}
