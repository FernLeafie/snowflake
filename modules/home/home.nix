{ config, pkgs, ... }:
let
  gitcfg = config.programs.git;
in
{
  imports = [
    ./apps # graphical applications
    ./base # base system configurations
    ./programs # terminal applications
    ./shell # shell options and replacement terminal commands
    ./services # user services
    ./system # wm, de, and or shell
    ./tooling # programming language specific configurations

    ./catppuccin.nix
    ./xdg.nix
    ./xdg-mime.nix
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      diff = {
        algorithm = "histogram";
      };
    };
  };

  programs.jujutsu = {
    inherit (gitcfg) enable;

    settings = {
      user = {
        inherit (gitcfg.settings.user) name email;
      };
      ui = {
        editor = "nvim";
        diff-formatter = [
          "${pkgs.delta}/bin/delta"
          # "--paging=never" # alternatively auto
          "--line-numbers"
          "$left"
          "$right"
        ];
      };
    };
  };

  home.packages = with pkgs; [
    jjui
  ];

  programs.home-manager.enable = true;
}
