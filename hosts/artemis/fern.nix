{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./../../modules/home/fern.nix
    ];
  snow.tooling.nix.enable = true;
  snow.graphical.enable = true;
}
