{ config, lib, pkgs, ... }:
{
  plugins.notify = {
    enable = true;
    settings = {
      max_width = 50;
      max_height = 10;
      render = "wrapped-default";
    };
    luaConfig.post = ''
      vim.notify = require('notify')
    '';
  };
}
