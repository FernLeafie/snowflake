{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.emulation.azahar.enable {
    environment.systemPackages = [ pkgs.azahar ];
  };
}
