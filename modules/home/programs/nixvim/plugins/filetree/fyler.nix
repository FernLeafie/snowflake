{
  config,
  lib,
  pkgs,
  ...
}:
{
  opts = {
    showtabline = 2;
  };
  extraPlugins = with pkgs.vimPlugins; [
    fyler-nvim
    nvim-web-devicons
  ];
  extraConfigLua = ''
        require('fyler').setup({
          extensions = {
            git = {
              enabled = true,
              -- inline = false, -- cute, but goes outside the screen
            },
            watcher = { enabled = true }
          },
          integrations = {
            icon = 'nvim_web_devicons'
          },
          kind_presets = {
    				floating = {
    					border = "rounded",
    				},
            split_left_most = { width = 28 },
    			},
          win_opts = {
    				cursorline = true,
    			},
          mappings = {
            n = {
              ['-'] = {
                action = 'visit',
                args = { parent = true },
                desc = 'Go to parent directory',
              },
              ['.'] = {
                action = 'visit',
                args = { cursor = true },
                desc = 'Enter directory under cursor',
              },
              ['<BS>'] = {
                action = 'shrink',
                args = { parent = true },
                desc = 'Collapse parent directory',
              },
              ['<C-R>'] = {
                action = 'refresh',
                args = { recursive = true, force = true },
                desc = 'Force refresh tree',
              },
              ['<C-S>'] = {
                action = 'select',
                args = { split = true },
                desc = 'Open in horizontal split',
              },
              ['<C-T>'] = {
                action = 'select',
                args = { tabedit = true },
                desc = 'Open in new tab',
              },
              ['<C-V>'] = {
                action = 'select',
                args = { vsplit = true },
                desc = 'Open in vertical split',
              },
              ['<CR>'] = {
                action = 'select',
                args = { pick = true },
                desc = 'Open with window picker',
              },
              -- ['<space>'] = { -- really nice, but conflicts with leader
              --   action = 'select',
              --   args = { pick = true },
              --   desc = 'Open with window picker',
              -- },
              ['<2-LeftMouse>'] = {
                action = 'select',
                args = { pick = true },
                desc = 'Open with window picker',
              },
              ['='] = {
                action = 'visit',
                desc = 'Go to root directory',
              },
              ['g.'] = {
                action = 'toggle_ui',
                args = { 'hidden_items' },
                desc = 'Toggle hidden files',
              },
              ['gi'] = {
                action = 'toggle_ui',
                args = { 'indent_guides' },
                desc = 'Toggle indent guides',
              },
              ['q'] = {
                action = 'close',
                desc = 'Close finder',
              },
            },
          },
          ui = {
            hidden_items = {
              always_hidden = { ".git" }
            },
            indent_guides = true,
          }
        })
  '';

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>e";
      action.__raw = ''
        function()
          require('fyler').toggle({ kind = 'floating' })
        end
      '';
      options.desc = "Toggle Explorer (Floating)";
    }
    {
      mode = [ "n" ];
      key = "<leader>E";
      action.__raw = ''
        function()
        	local fyler = require('fyler')
          local currentBuf = vim.api.nvim_get_current_buf()
        	local currentBufFt = vim.api.nvim_get_option_value('filetype', { buf = currentBuf })
        	if currentBufFt == 'fyler_finder' then
            fyler.toggle({ kind = 'split_left_most' })
        	else
            fyler.open({ kind = 'split_left_most' })
        	end
        end
      '';
      options.desc = "Toggle Explorer (Side panel)";
    }
  ];
}
