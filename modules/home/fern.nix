{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.git = {
    settings = {
      user = {
        name = "Fernleafie";
        email = "fernleafie" + "@" + "gmail" + "." + "com"; # those scrapers better not use regex/j
      };
    };
  };

  home = {
    username = "fern-snowleafie";
    homeDirectory = "/home/fern-snowleafie";
    stateVersion = "26.05";
  };

  home.file."${config.xdg.userDirs.pictures}/wallpapers".source = "${
    (pkgs.callPackage ./wallpapers/fern.nix { })
  }";
}
