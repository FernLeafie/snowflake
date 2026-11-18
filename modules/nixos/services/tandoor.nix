{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.snow.services.tandoor;
in
{
  config = mkIf cfg.enable {
    services.tandoor-recipes = {
      enable = true;
      address = "0.0.0.0";
      port = 58008;
      extraConfig = {
        # currently just share it over the tailnet
        ALLOWED_HOSTS = "${config.networking.hostName},127.0.0.1,localhost";
        ENABLE_SIGNUP = 1;
        SPACE_AI_ENABLED = 0;
        # [TODO] ugh, actually put SECRET_KEY here, fun times
        # Definitely need to get some secrets manager like sops involved for it
      };
    };
  };
}
