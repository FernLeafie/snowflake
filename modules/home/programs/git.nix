{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;

    lfs.enable = true;

    # git commit signing
    signing = {
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      diff = {
        algorithm = "histogram";
      };
    };
  };
}
