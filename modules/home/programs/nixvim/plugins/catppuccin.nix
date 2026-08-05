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
      transparent = true;
    };
    custom_highlights.__raw = ''
      function(colors)
        return {
          FloatBorder = { fg = colors.mauve },
          NotifyINFOBorder = { fg = colors.mauve },
          BlinkCmpMenuBorder = { fg = colors.mauve },
          HarpoonBorder = { fg = colors.mauve },

          -- fixes the inverted color of the maple mono badges, possibly change to the regular overlay 2 comment colour if the non colored caps look too out of place
          ["@comment.warning.comment"] = { fg = colors.yellow },
          ["@comment.error.comment"] = { fg = colors.red },
          ["@comment.todo.comment"] = { fg = colors.flamingo },
          ["@comment.note.comment"] = { fg = colors.blue },
          ["@comment.hint.comment"] = { fg = colors.blue },
        }
      end
    '';
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
