{
  inputs,
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    imports = [
      ./plugins
      ./mappings.nix
      ./options.nix
    ];

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    colorschemes.catppuccin.enable = true;
  };
  xdg.configFile."nvim/resources/NeovimShadowed_catppuccin-all.png".source =
    ./resources/NeovimShadowed_catppuccin-all.png;
}
