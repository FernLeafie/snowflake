{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib.meta) getExe;
in
{
  programs = {
    # lsd.enable = true;
    eza = {
      enable = true;
      icons = "auto";
      extraOptions = [
        "--group"
        "--short-nix"
        "--group-directories-first"
        "--binary"
        "--time-style"
        "relative"
      ];
    };
    fish = {
      # overwrite the default aliases to use -A instead of -a
      shellAliases = rec {
        ls = "eza"; # set by default so the arguments get included
        ll = "eza -l";
        la = "eza -A";
        lt = "eza --tree";
        lla = "eza -lA";
        llt = "eza -l --tree";
      };
    };

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
      ];
    };
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };
}
