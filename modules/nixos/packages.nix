{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (lib.lists) optionals;
  cfgprof = config.snow.profiles;
in
{
  environment.systemPackages = (
    with pkgs;
    [
      vim
      wget
      git
      jujutsu
      fastfetch
      fish
      jq
      neovim
      gcc
      ripgrep
      nfs-utils
    ]
    ++ optionals cfgprof.graphical.enable [
      thunderbird
      kitty
      niri
    ]
  );

  fonts = mkIf cfgprof.graphical.enable {
    enableDefaultPackages = true;
    packages = with pkgs; [
      maple-mono.NF-CN-unhinted
    ];
  };

  programs = {
    firefox.enable = mkIf cfgprof.graphical.enable true;
    fish.enable = true;
  };
}
