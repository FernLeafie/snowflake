{ config, lib, pkgs, ... }:
{
  plugins.colorizer = {
    enable = true;
    settings = {
      options = {
        parsers = {
          css = true;
          css_fn = true;
          names.enable = false;
        };
        display = {
          background = {
            bright_fg = "#11111b";
            dark_fg = "#cdd6f4";
          };
        };
      };
    };
  };
}
