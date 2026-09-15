{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.emulation.cemu.enable {
    environment.systemPackages = [ pkgs.cemu ];
  };
}
