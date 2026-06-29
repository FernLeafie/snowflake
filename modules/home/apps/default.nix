{ config, pkgs, ... }:
{
  imports =
    [
      ./kitty.nix
      ./nixcord
      ./gaming
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
