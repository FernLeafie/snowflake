{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-citizen.nixosModules.default
  ];

  config = {
    programs.rsi-launcher = lib.mkIf config.snow.gaming.star-citizen.enable {
      enable = true;
      location = "$XDG_GAMES_DIR/rsi-launcher";
      preCommands = ''
        export DXVK_HUD=compiler
        export MANGO_HUD=1
      '';
      postCommands = "";
    };

    # [FIXME] for some reason seems to miss, causing wine to be built from the ground up
    nix.settings = {
      substituters = [ "https://nix-citizen.cachix.org" ];
      trusted-public-keys = [ "nix-citizen.cachix.org-1:lPMkWc2X8XD4/7YPEEwXKKBg+SVbYTVrAaLA2wQTKCo=" ];
    };
  };
}
