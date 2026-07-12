{
  config,
  lib,
  pkgs,
  ...
}:
{
  colorschemes.catppuccin.settings = {
    transparent_background = true;
    float = {
      transparent = false;
    };
    custom_highlights = {
      __raw = ''
        function(colors)
          return {
            FloatBorder = { fg = colors.mauve },
            NotifyINFOBorder = { fg = colors.mauve },
            BlinkCmpMenuBorder = { fg = colors.mauve },
            HarpoonBorder = { fg = colors.mauve },
          }
        end
      '';
    };
    integrations = {
      alpha = true;
      blink_cmp = {
        style = "bordered";
      };
      blink_indent = true;
      fidget = true;
      gitsigns = true;
      harpoon = true;
      notify = true;
      nvimtree = true;
      render_markdown = true;
      treesitter = true;
      treesitter_context = true;
      which_key = true;
      ufo = true;
    };
  };
}
