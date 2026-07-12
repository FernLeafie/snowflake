{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins.nvim-autopairs = {
    enable = true;
    settings = {
      check_ts = true;
      fast_wrap = {
        end_key = "$";
        map = "<M-e>";
      };
    };
  };
}
