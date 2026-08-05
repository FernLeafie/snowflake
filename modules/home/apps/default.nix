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
    # custom
    (callPackage ./hayase.nix {
      forceX11 = false;
    })
  ];
}
