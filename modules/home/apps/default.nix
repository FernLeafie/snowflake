{ config, pkgs, ... }:
{
  imports = [
    ./base
    ./kitty.nix
    ./nixcord
    ./gamedev
    ./gaming
    ./graphical
    ./content-creation
    ./writing
  ];
  home.packages = with pkgs; [
    nur.repos.Ev357.hayase
  ];
  programs.qalculate = {
    enable = true;
    package = pkgs.libqalculate;
    settings.Mode.calculate_as_you_type = 1;
  };
}
