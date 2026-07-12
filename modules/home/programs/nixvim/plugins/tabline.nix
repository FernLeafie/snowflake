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
    tabby-nvim
    nvim-web-devicons
  ];
  extraConfigLua = ''
        local mocha = require('catppuccin.palettes').get_palette('mocha')
        local theme = {
        	fill = 'TabLineFill',
        	head = { fg = mocha.crust, bg = mocha.yellow, style = 'italic' },
        	current_tab = { fg = mocha.crust, bg = mocha.mauve, style = 'italic' },
        	tab = { fg = mocha.mauve, bg = mocha.surface0, style = 'normal' },
        	win = { fg = mocha.mauve, bg = mocha.surface0, style = 'normal' },
        	modified = { fg = mocha.teal, bg = mocha.surface0, style = 'normal' },
        	warning = { fg = mocha.yellow, bg = mocha.surface0, style = 'normal' },
        	danger = { fg = mocha.red, bg = mocha.surface0, style = 'normal' },
        	tail = { fg = mocha.mauve, bg = mocha.surface0, style = 'italic' },
        }

        local function tab_modified(tab)
        	local wins = require('tabby.module.api').get_tab_wins(tab)
        	for i, x in pairs(wins) do
        		if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
        			return '●'
        		end
        	end
        	return ''
        end

        local function lsp_diag(buf)
        	local diagnostics = vim.diagnostic.get(buf)
        	local count = { 0, 0, 0, 0 }

        	for _, diagnostic in ipairs(diagnostics) do
        		count[diagnostic.severity] = count[diagnostic.severity] + 1
        	end
        	if count[1] > 0 then
        		return vim.bo[buf].modified and '' or ''
        	elseif count[2] > 0 then
        		return vim.bo[buf].modified and '' or ''
        	end
        	return vim.bo[buf].modified and '●' or ""
        end

        require('tabby').setup({
          line = function (line)
            return
            {
              {
              { '  ', hl = theme.head },
              line.sep('', theme.head, theme.fill),
              },
              line.tabs().foreach(function(tab)
              local hl = tab.is_current() and theme.current_tab or theme.tab
              return {
              line.sep('', hl, theme.fill),
              tab.in_jump_mode() and tab.jump_key() or tab.number(),
              -- gets the icon of the currently open win in tab
              -- tab.current_win().file_icon() might work instead
              -- but then there's no possibility of future granularity
              tab.wins().foreach(function(win)
              if win.is_current() == true then
              return win.file_icon()
              else
              return ""
    						end
    					end),
    					tab.name(),
    					tab.close_btn(tab_modified(tab.id)),
    					line.sep('', hl, theme.fill),
    					hl = hl,
    					margin = ' ',
    				}
    			end),
    			line.spacer(),
    			line
    				.wins_in_tab(line.api.get_current_tab())
    				-- filters out nvimtree
    				.filter(function(win)
    					if string.find(win.buf_name(), 'NvimTree') then
    						return false
    					else
    						return true
    					end
    				end)
    				.foreach(function(win)
    					local hl = theme.win
    					-- sets the window highlight depending on lsp status
    					local lsp = lsp_diag(win.buf().id)
    					if lsp == '' or lsp == '' then
    						hl = theme.danger
    					elseif lsp == '' or lsp == '' then
    						hl = theme.warning
    					elseif lsp == '●' then
    						hl = theme.modified
    					end
    					return {
    						line.sep('', theme.win, theme.fill),
    						win.file_icon(),
    						win.buf_name(),
    						lsp,
    						line.sep('', theme.win, theme.fill),
    						hl = hl,
    						margin = ' ',
    					}
    				end),
    			{
    				line.sep('', theme.tail, theme.fill),
    				{ '  ', hl = theme.tail },
    			},
    			hl = theme.fill,
    		}
    	end,
    	option = {
    		buf_name = {
    			mode = 'unique', -- or 'relative', 'tail', 'shorten'
    		},
    	},
    })
  '';

  keymaps = [
    # buffers
    {
      mode = [ "n" ];
      key = "<leader>bn";
      action = "<Cmd>bnext<CR>";
      options.desc = "Next buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bp";
      action = "<Cmd>bprevious<CR>";
      options.desc = "Previous buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bq";
      action = "<Cmd>BufferClose<CR>";
      options.desc = "Close buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bQ";
      action = "<Cmd>BufferClose!<CR>";
      options.desc = "Force close buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bU";
      action = "<Cmd>:bufdo bd<CR>";
      options.desc = "Close all buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bvs";
      action = "<Cmd>vsplit<CR><Cmd>bnext<CR>";
      options.desc = "Open next buffer in vsplit";
    }
    # tabs
    {
      mode = [ "n" ];
      key = "<leader>ta";
      action = "<Cmd>$tabnew<CR>";
      options.desc = "New tab";
    }
    {
      mode = [ "n" ];
      key = "<leader>tc";
      action = "<Cmd>tabclose<CR>";
      options.desc = "Close tab";
    }
    {
      mode = [ "n" ];
      key = "<leader>tj";
      action = "<Cmd>Tabby jump_to_tab<CR>";
      options.desc = "Tab jump mode";
    }
    {
      mode = [ "n" ];
      key = "<leader>tf";
      action = "<Cmd>Tabby pick_window<CR>";
      options.desc = "Find tab";
    }
    {
      mode = [ "n" ];
      key = "<leader>to";
      action = "<Cmd>tabonly<CR>";
      options.desc = "Close all other tabs";
    }
    {
      mode = [ "n" ];
      key = "<leader>tn";
      action = "<Cmd>tabn<CR>";
      options.desc = "Next tab";
    }
    {
      mode = [ "n" ];
      key = "<leader>tp";
      action = "<Cmd>tabp<CR>";
      options.desc = "Previous tab";
    }
    {
      mode = [ "n" ];
      key = "<S-l>";
      action = "<Cmd>tabn<CR>";
      options.desc = "Next tab";
    }
    {
      mode = [ "n" ];
      key = "<S-h>";
      action = "<Cmd>tabp<CR>";
      options.desc = "previous tab";
    }
    {
      mode = [ "n" ];
      key = "<leader>tmp";
      action = "<Cmd>-tabmove<CR>";
      options.desc = "Move tab back";
    }
    {
      mode = [ "n" ];
      key = "<leader>tmn";
      action = "<Cmd>+tabmove<CR>";
      options.desc = "Move tab forward";
    }
  ];
}
