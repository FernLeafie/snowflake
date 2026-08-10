{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri-flake.nixosModules.niri
  ];

  # disable the built in polkit agent, to let noctalias polkit agent take president instead
  systemd.user.services.niri-flake-polkit.enable = false;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    kitty
    catppuccin-qt5ct
    kdePackages.plasma-browser-integration
    xwayland-satellite

    # dolphin
    kdePackages.dolphin
    # plugins
    kdePackages.ark
    kdePackages.audiocd-kio
    kdePackages.baloo
    kdePackages.dolphin-plugins
    kdePackages.kio
    kdePackages.kio-admin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    # previews
    kdePackages.ffmpegthumbs
    icoutils
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kimageformats
    kdePackages.qtimageformats
    kdePackages.taglib
    kdePackages.qtsvg
    # others
    kdePackages.kservice
    kdePackages.qt6ct
    kdePackages.kde-cli-tools
  ];

  services.udisks2.enable = true; # makes dolphin able to mount and manage filesystems

  # [HACK] fix for "open with" in dolphin, see https://github.com/NixOS/nixpkgs/issues/409986
  environment.etc."xdg/menus/applications.menu".source = pkgs.runCommand "applications.menu" { } ''
    cp ${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu $out
  '';

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      kdePackages.xdg-desktop-portal-kde
    ];
    config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "kde" ]; # GTK or "KDE"
    };
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
