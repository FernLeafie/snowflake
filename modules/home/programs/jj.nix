{ config, pkgs, ... }:
let
  gitcfg = config.programs.git;
in
{
  programs.jujutsu = {
    inherit (gitcfg) enable;

    settings = {
      user = {
        inherit (gitcfg.settings.user) name email;
      };
      ui = {
        # removes the hint
        default-command = [ "log" ];

        editor = "nvim";
        diff-formatter = [
          "${pkgs.delta}/bin/delta"
          # "--paging=never" # alternatively auto
          "--line-numbers"
          "$left"
          "$right"
        ];
      };
      signing = {
        # don't sign on creation
        behavior = "drop";
        backend = "ssh";
        key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub"; # hopefully this is safe :3?
      };
      revsets = {
        # sign on push instead
        git-sign-on-push = "~signed() & mine()";
      };
    };
  };

  home.packages = with pkgs; [
    jjui
  ];
}
