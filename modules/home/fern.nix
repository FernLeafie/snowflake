{ config, pkgs, ... }:
{
  imports =
    [
      ./home.nix
    ];

  programs.git = {
    settings = {
      user = {
        name = "Fernleafie";
        email = "fernleafie@gmail.com";
      };
    };
  };

  home = {
    username = "fern-snowleafie";
    homeDirectory = "/home/fern-snowleafie";
    stateVersion = "26.05";
  };
}
