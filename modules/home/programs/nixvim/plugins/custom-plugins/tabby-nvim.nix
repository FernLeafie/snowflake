{ lib, pkgs, ... }:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "tabby-nvim";
  package = "tabby-nvim";
  description = ''
    A declarative, highly configurable, and neovim style tabline plugin. Use your nvim tabs as a workspace multiplexer!
  ''; # is what the program itself says
  url = "https://github.com/nanozuki/tabby.nvim";

  maintainers = with lib.maintainers; [ FernLeafie ];

  extraPlugins = with pkgs.vimPlugins; [
    nvim-web-devicons
  ];

  moduleName = "tabby";
  # [NOTE] or something, not sure if theme can go there
  settingsExample = {
    line.__raw = ''
      function(line)
        local theme = {
          fill = 'TabLineFill',
          head = 'TabLine',
          current_tab = 'TabLineSel',
          tab = 'TabLine',
          win = 'TabLine',
          tail = 'TabLine',
        }
        return {
          {
            { '  ', hl = theme.head },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep('', hl, theme.fill),
              tab.is_current() and '' or '󰆣',
              tab.number(),
              tab.name(),
              tab.close_btn(''),
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep('', theme.win, theme.fill),
              win.is_current() and '' or '',
              win.buf_name(),
              line.sep('', theme.win, theme.fill),
              hl = theme.win,
              margin = ' ',
            }
          end),
          {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
          },
          hl = theme.fill,
        }
      end
    '';
    option = {
      buf_name = {
        mode = "unique";
      };
    };
  };
}
