{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.samba = {
    # package = pkgs.samba4Full;
    usershares.enable = true;
    enable = true;
    openFirewall = true;
  };

  # To be discoverable with windows
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
