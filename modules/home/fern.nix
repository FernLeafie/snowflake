{ config, pkgs, ... }:
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
}
