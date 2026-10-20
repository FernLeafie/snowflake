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
  };

  programs.jujutsu = {
    inherit (gitcfg) enable;

    settings = {
      user = {
        inherit (gitcfg.settings.user) name email;
      };
    };
  };

  home.packages = with pkgs; [
    lazyjj
  ];

  programs.home-manager.enable = true;
}
