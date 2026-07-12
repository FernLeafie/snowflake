{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };
}
