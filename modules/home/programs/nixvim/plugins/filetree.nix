{ config, lib, pkgs, ... }:
{
  plugins.nvim-tree = {
    enable = true;
    settings = {
      renderer = {
        icons = {
          glyphs = {
            folder = {
              default = "";
              open = "";
              empty = "";
              empty_open = "";
              symlink = "";
              symlink_open = "";
            };
            git = {
              unstaged = "";
              staged = "";
              unmerged = "";
              renamed = "";
              untracked = "";
              deleted = "";
              ignored = "";
            };
          };
        };
      };
      # natural sort
      sort_by = {
        __raw = ''
          function(nodes)
            table.sort(nodes, function(left, right)
                left = left.name:lower()
                right = right.name:lower()

                if left == right then
                  return false
                end

                for i = 1, math.max(string.len(left), string.len(right)), 1 do
                  local l = string.sub(left, i, -1)
                  local r = string.sub(right, i, -1)

                  if type(tonumber(string.sub(l, 1, 1))) == 'number' and type(tonumber(string.sub(r, 1, 1))) == 'number' then
                    local l_number = tonumber(string.match(l, '^[0-9]+'))
                    local r_number = tonumber(string.match(r, '^[0-9]+'))

                    if l_number ~= r_number then
                      return l_number < r_number
                    end
                  elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
                    return l < r
                  end
                end
              end)
            end
        '';
      };
      # aria navigation
      on_attach = {
        __raw = ''
          function(bufnr)
            local api = require('nvim-tree.api')
            -- description and options for keybinds
            local function opts(desc)
              return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            -- get all default keybinds
            api.config.mappings.default_on_attach(bufnr)
            -- function for left to assign to keybindings
            local lefty = function()
              local node_at_cursor = api.tree.get_node_under_cursor()
              -- if it's a node and it's open, close
              if node_at_cursor.nodes and node_at_cursor.open then
                api.node.open.edit()
                -- else left jumps up to parent
              else
                api.node.navigate.parent()
              end
            end
            -- function for right to assign to keybindings
            local righty = function()
              local node_at_cursor = api.tree.get_node_under_cursor()
              -- if it's a closed node, open it
              if node_at_cursor.nodes and not node_at_cursor.open then
                -- expand or collapse folder
                api.node.open.edit()
              else
                -- open file
                api.node.open.edit()
              end
            end
            vim.keymap.set('n', 'h', lefty, opts('Close directory or jump to parent'))
            vim.keymap.set('n', '<Left>', lefty, opts('Close directory or jump to parent'))
            vim.keymap.set('n', '<Right>', righty, opts('Open'))
            vim.keymap.set('n', 'l', righty, opts('Open'))

            -- unrelated bindings
            vim.keymap.del('n', '<C-t>', { buffer = bufnr })
            vim.keymap.set('n', '<CR>', api.node.open.tab, opts('Open in a new tab'))
            vim.keymap.set('n', '<S-CR>', api.node.open.edit, opts('Open'))
          end
        '';
      };
    };
  };

  # hopefully quit as if nvim tree isnt there
  autoCmd = [
    {
      event = [
        "BufEnter"
        "QuitPre"
      ];
      callback = {
        __raw = ''
          function(e)
            local tree = require('nvim-tree.api').tree

            -- Nothing to do if tree is not opened
            if not tree.is_visible() then
              return
            end

            -- How many focusable windows do we have? (excluding e.g. incline status window)
            local winCount = 0
            for _,winId in ipairs(vim.api.nvim_list_wins()) do
              if vim.api.nvim_win_get_config(winId).focusable then
                winCount = winCount + 1
              end
            end

            -- We want to quit and only one window besides tree is left
            if e.event == 'QuitPre' and winCount == 2 then
              vim.api.nvim_cmd({cmd = 'qall'}, {})
            end

            -- :bd was probably issued an only tree window is left
            -- Behave as if tree was closed (see `:h :bd`)
            if e.event == 'BufEnter' and winCount == 1 then
              -- Required to avoid "Vim:E444: Cannot close last window"
              vim.defer_fn(function()
                -- close nvim-tree: will go to the last buffer used before closing
                tree.toggle({find_file = true, focus = true})
                -- re-open nivm-tree
                tree.toggle({find_file = true, focus = false})
              end, 10)
            end
          end
        '';
      };
    }
  ];
  keymaps = [
    {
      mode = [ "n" ];
      key = "<C-t>";
      action = {
        __raw = ''
          function()
          	local nvimTree = require('nvim-tree.api')
          	local currentBuf = vim.api.nvim_get_current_buf()
          	local currentBufFt = vim.api.nvim_get_option_value('filetype', { buf = currentBuf })
          	if currentBufFt == 'NvimTree' then
          		nvimTree.tree.toggle()
          	else
          		nvimTree.tree.focus()
          	end
          end
        '';
      };
      options.desc = "Open NvimTree";
    }
  ];
}
