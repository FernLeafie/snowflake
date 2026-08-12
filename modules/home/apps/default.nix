{ config, pkgs, ... }:
{
  imports = [
    ./base
    ./kitty.nix
    ./nixcord
    ./gamedev
    ./gaming
    ./graphical
    ./video
    ./writing
  ];
  home.packages = with pkgs; [
    libqalculate
    nur.repos.Ev357.hayase
  ];
}
