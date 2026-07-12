{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    web-devicons = {
      enable = true;
      settings = {
        override = {
          fish = {
            icon = " ";
            color = "#7EBAE4"; # [FIXME] doesnt listen to colour, might be due to auto-colors
            cterm_color = "33";
            name = "Fish";
          };
        };
      };
    };
    tiny-devicons-auto-colors = {
      enable = true;
      settings.colors.__raw = ''require("catppuccin.palettes").get_palette("mocha")'';
    };
  };
}
