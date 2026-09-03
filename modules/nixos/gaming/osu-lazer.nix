{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.snow.gaming.osu-lazer.enable {
    environment.systemPackages = [ pkgs.osu-lazer-bin ];
  };
}
