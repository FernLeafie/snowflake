{
  inputs,
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  programs.rmpc = {
    enable = true;
    config = builtins.readFile ./rmpc-config.ron;
    package = inputs.rmpc.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
  xdg.configFile."rmpc/themes/custom.ron".text = builtins.readFile ./rmpc-theme.ron;

  home.packages = [
    inputs.rmpc.packages.${pkgs.stdenv.hostPlatform.system}.rmpcd
  ];
  xdg.configFile."rmpcd/init.lua".text = builtins.readFile ./rmpcd-init.lua;

  services = {
    mpd.enable = true;
  };
}
