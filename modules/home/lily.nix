{ config, pkgs, ... }:
{
  imports =
    [
      ./home.nix
    ];

  programs.git = {
    settings = {
      user = {
        name = "Kyoko";
        email = "129420497+CodedKyoko@users/noreply.github.com";
      };
    };
  };

  home = {
    username = "lily-snowleafie";
    homeDirectory = "/home/lily-snowleafie";
    stateVersion = "26.05";
  };
}
