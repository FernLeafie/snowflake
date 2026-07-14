{ config, pkgs, ... }:
{
  imports = [
    ./base
    ./kitty.nix
    ./nixcord
    ./gaming
    ./graphical
    ./video
  ];
  home.packages = with pkgs; [
    libreoffice-qt

    # custom
    (callPackage ./hayase.nix {
      forceX11 = false;
    })
  ];
}
