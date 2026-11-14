{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      diff = {
        algorithm = "histogram";
      };
    };
  };
}
