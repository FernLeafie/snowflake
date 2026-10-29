{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.emulation.eden.enable {
    environment.systemPackages = [ pkgs.eden ];
  };
}
