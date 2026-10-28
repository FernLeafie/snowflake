{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.emulation.shadps4.enable {
    environment.systemPackages = [ pkgs.shadps4 ];
  };
}
