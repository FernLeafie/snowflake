{ lib, pkgs, ... }:
{
  imports =
    [
      ./gimp.nix
      ./inkscape.nix
      ./krita.nix
    ];

  options = {
    snow.graphical.enable =
      lib.mkEnableOption "all graphics editing software" // {
        default = false;
      };
  };

  config = {
    home.packages = with pkgs; [
      lutgen
      lutgen-studio
      imagemagick
    ];
  };
}
