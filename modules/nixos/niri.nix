{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri-flake.nixosModules.niri
  ];

  services.displayManager.ly = {
    enable = true;
    settings = {
      session_log = ".local/state/ly-session.log";
    };
  };

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
  ];

  # [HACK] fix for "open with" in dolphin, see https://github.com/NixOS/nixpkgs/issues/409986
  environment.etc."xdg/menus/applications.menu".source = ./dolphin.menu;

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
