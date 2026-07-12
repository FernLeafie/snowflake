{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins.alpha = {
    enable = true;
    settings = {
      layout = [
        {
          type = "padding";
          val = 1;
        }
        {
          type = "terminal";
          command = {
            __raw = ''"chafa --size=69x20 -f symbols --symbols all " .. vim.fn.stdpath('config') .. "/resources/NeovimShadowed_catppuccin-all.png"'';
          };
          width = 69;
          height = 19;
          opts.redraw = true;
        }
        {
          type = "padding";
          val = 1;
        }
        {
          type = "text";
          opts = {
            hl = "AlphaFooter"; # Type
            position = "center";
          };
          val = [ { __raw = "greeting()"; } ];
        }
        {
          type = "padding";
          val = 1;
        }
        {
          type = "group";
          opts.spacing = 1;
          val = [
            {
              type = "button";
              val = "  New file";
              on_press = "<Cmd>ene <BAR> startinsert <CR>";
              opts = {
                keymap = [
                  "n"
                  "e"
                  "<Cmd>ene <BAR> startinsert <CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                shortcut = "e";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "button";
              val = "  Find file";
              on_press = "<Cmd>Telescope find_files<CR>";
              opts = {
                keymap = [
                  "n"
                  "f"
                  "<Cmd>Telescope find_files<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                shortcut = "f";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "button";
              val = "  Recently opened";
              on_press = "<Cmd>Telescope oldfiles<CR>";
              opts = {
                keymap = [
                  "n"
                  "r"
                  "<Cmd>Telescope oldfiles<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                shortcut = "r";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "button";
              val = "  Browse cwd";
              on_press = "<Cmd>NvimTreeOpen<CR>";
              opts = {
                keymap = [
                  "n"
                  "t"
                  "<Cmd>NvimTreeOpen<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                shortcut = "t";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "button";
              val = "  Quit";
              on_press = "<Cmd>q!<CR>";
              opts = {
                keymap = [
                  "n"
                  "q"
                  "<Cmd>q!<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                shortcut = "q";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
          ];
        }
        {
          type = "padding";
          val = 1;
        }
        {
          opts = {
            hl = "AlphaHeader";
            position = "center";
          };
          type = "text";
          val = "❆ snowflake ❆";
        }
      ];
    };
    # defining greeter function as the field doesnt take inline functions
    luaConfig.pre = ''
      local function greeting()
      	local platform = package.config:sub(1, 1)
      	-- Sets username to a specific string if on windows, and pulls the username from the device if on linux
      	if platform == '\\' then
      		username = 'Fern Snowleafie'
      	elseif platform == '/' then
      		username = os.getenv('USER') or os.getenv('USERNAME') or 'user'
      	end

      	local tableTime = os.date('*t')
      	local hour = tableTime.hour
      	local greetingsTable = {
      		[1] = '  Sleep well',
      		[2] = '  Good morning', -- 󰖜 
      		[3] = '  Good day', -- 󰖙  
      		[4] = '  Good afternoon', -- 󰖛 
      		[5] = '  Good evening', -- 
      		[6] = '󱡇  Good night',
      	}
      	local greetingIndex = 0
      	if hour == 23 or hour < 7 then
      		greetingIndex = 1
      	elseif hour < 10 then
      		greetingIndex = 2
      	elseif hour >= 10 and hour < 15 then
      		greetingIndex = 3
      	elseif hour >= 15 and hour < 18 then
      		greetingIndex = 4
      	elseif hour >= 18 and hour < 21 then
      		greetingIndex = 5
      	elseif hour >= 21 then
      		greetingIndex = 6
      	end
      	return greetingsTable[greetingIndex] .. ', ' .. username
      end
    '';
  };
  # for logo generation
  dependencies.chafa.enable = true;
}
