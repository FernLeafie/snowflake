{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.snow.user-services.kdeconnect.enable {

    programs.kdeconnect.enable = true;
  };
}
