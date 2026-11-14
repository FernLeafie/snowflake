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
    };
  };

  home.packages = with pkgs; [
    jjui
  ];
}
