{ config, pkgs, ... }:
{
  imports = [
    ./apps # graphical applications
    ./base # base system configurations
    ./programs # terminal applications
    ./shell # shell options and replacement terminal commands
    ./services # user services
    ./system # wm, de, and or shell
    ./tooling # programming language specific configurations

    ./catppuccin.nix
  ];

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps.enable = true;
    userDirs = {
      enable = true;
      createDirectories = false;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      projects = "${config.home.homeDirectory}/projects";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
      extraConfig = {
        GAMES = "${config.home.homeDirectory}/games";
        LIBRARY = "${config.home.homeDirectory}/library";
      };
      setSessionVariables = true;
    };
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.home-manager.enable = true;
}
