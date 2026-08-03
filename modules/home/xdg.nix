{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg = {
    enable = true;
    mime.enable = true;
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
  # Proper icons for the two custom directories
  home.file."${config.xdg.userDirs.projects}/.directory".text = ''
    [Desktop Entry]
    Icon=folder-projects
  '';
  home.file."${config.xdg.userDirs.extraConfig.GAMES}/.directory".text = ''
    [Desktop Entry]
    Icon=folder-games
  '';
  home.file."${config.xdg.userDirs.extraConfig.LIBRARY}/.directory".text = ''
    [Desktop Entry]
    Icon=folder-books
  '';
}
