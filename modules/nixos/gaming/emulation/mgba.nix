{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.emulation.mgba.enable {
    environment.systemPackages = [ pkgs.mgba ];
  };
}
