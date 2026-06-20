{ config, pkgs, ... }:
{
  imports =
    [
      ./niri
      ./noctalia
      ./apps
      ./programs
      ./base
      ./shell
      ./system # wm, de, and or shell
      ./catppuccin.nix
    ];

  xdg.enable = true;
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = false;
    desktop = "${config.home.homeDirectory}/desktop";
    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/downloads";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pictures";
    projects = "${config.home.homeDirectory}/projects";
    videos = "${config.home.homeDirectory}/videos";
    setSessionVariables = true;
  };
  programs.git = {
    enable = true;
  };
}
