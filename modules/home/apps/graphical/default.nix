{ lib, pkgs, ... }:
{
  imports =
    [
      ./gimp.nix
      ./inkscape.nix
      ./krita.nix
    ];

  home.packages = with pkgs; [
    lutgen
    lutgen-studio
    imagemagick
  ];
}
