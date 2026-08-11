{ config, pkgs, ... }:
{
  programs.git = {
    settings = {
      user = {
        name = "CodedKyoko";
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
