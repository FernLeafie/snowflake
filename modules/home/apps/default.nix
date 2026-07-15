{ config, pkgs, ... }:
{
  imports = [
    ./base
    ./kitty.nix
    ./nixcord
    ./gaming
    ./graphical
    ./video
    ./writing
  ];
  home.packages = with pkgs; [
    # custom
    (callPackage ./hayase.nix {
      forceX11 = false;
    })
  ];
}
