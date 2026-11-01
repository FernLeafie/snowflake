{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.emulation.melonds.enable {
    environment.systemPackages = [ pkgs.melonds ];
  };
}
