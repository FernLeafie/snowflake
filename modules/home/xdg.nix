{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfghomedir = config.home.homeDirectory;
  cfgxdg = config.xdg;
in
{
  xdg = {
    enable = true;
    mime.enable = true;
    userDirs = {
      enable = true;
      createDirectories = false;
      desktop = "${cfghomedir}/desktop";
      documents = "${cfghomedir}/documents";
      download = "${cfghomedir}/downloads";
      music = "${cfghomedir}/music";
      pictures = "${cfghomedir}/pictures";
      projects = "${cfghomedir}/projects";
      publicShare = "${cfghomedir}/public";
      templates = "${cfghomedir}/templates";
      videos = "${cfghomedir}/videos";

      extraConfig = {
        GAMES = "${cfghomedir}/games";
        LIBRARY = "${cfghomedir}/library";
      };
      setSessionVariables = true;
    };
  };
  home.sessionVariables = {
    # KDEHOME = "${cfgxdg.configHome}/kde";
    XCOMPOSECACHE = "${cfgxdg.cacheHome}/X11/xcompose";
    ERRFILE = "${cfgxdg.cacheHome}/X11/xsession-errors";
    WINEPREFIX = "${cfgxdg.dataHome}/wine";

    GNUPGHOME = "${cfgxdg.dataHome}/gnupg";
    HISTFILE = "${cfgxdg.stateHome}/bash/history";
    LESSHISTFILE = "${cfgxdg.stateHome}/less/history";
    MPLAYER_HOME = "${cfgxdg.configHome}/mplayer";

    CARGO_HOME = "${cfgxdg.dataHome}/cargo";
    RUSTUP_HOME = "${cfgxdg.dataHome}/rustup";
    DOTNET_CLI_HOME = "${cfgxdg.dataHome}/dotnet";
    NUGET_PACKAGES = "${cfgxdg.cacheHome}/NuGetPackages";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot='${cfgxdg.configHome}/java'";
    GRADLE_USER_HOME = "${cfgxdg.dataHome}/gradle";
    GOPATH = "${cfgxdg.dataHome}/go";
    GOMODCACHE = "${cfgxdg.cacheHome}/go/pkg/mod";
    NODE_REPL_HISTORY = "${cfgxdg.dataHome}/node_repl_history";
    NPM_CONFIG_INIT_MODULE = "${cfgxdg.configHome}/npm/config/npm-init.js";
    NPM_CONFIG_CACHE = "${cfgxdg.cacheHome}/npm";
    NPM_CONFIG_TMP = "/run/user/$UID/npm";
  };
  # Proper icons for the two custom directories
  home.file."${cfgxdg.userDirs.projects}/.directory".text = ''
    [Desktop Entry]
    Icon=folder-projects
  '';
  home.file."${cfgxdg.userDirs.extraConfig.GAMES}/.directory".text = ''
    [Desktop Entry]
    Icon=folder-games
  '';
  home.file."${cfgxdg.userDirs.extraConfig.LIBRARY}/.directory".text = ''
    [Desktop Entry]
    Icon=folder-books
  '';
}
