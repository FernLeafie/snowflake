{ config, pkgs, ... }:
{
  imports =
    [
      ./kitty.nix
      ./nixcord
      ./gaming
      ./video
    ];
  home.packages = with pkgs; [
    krita
    libreoffice-qt

    # custom
    (callPackage ./hayase.nix {
      forceX11 = false;
    })
  ];
}
