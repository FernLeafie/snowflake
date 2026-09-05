{ config, pkgs, ... }:
{
  programs.git = {
    settings = {
      user = {
        name = "Kyoko";
        email = "ohamsnow@gmail.com";
      };
    };
  };

  home = {
    username = "lily-snowleafie";
    homeDirectory = "/home/lily-snowleafie";
    stateVersion = "26.05";
  };
}
