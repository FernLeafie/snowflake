{ config, pkgs, ... }:
{
  imports =
    [
      ./fish-functions.nix
    ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.fish = {
    enable = true;
    generateCompletions = true;
    shellAliases = rec {
      bat = "${pkgs.bat}/bin/bat";
      cat = "${bat}";
      less = ''${bat} --paging=always --pager "${pkgs.less}/bin/less -RF"'';
      man = "batman";
    };
    shellAbbrs = {
      # git abbreviations
      gs = "git status";
      gd = "git diff";
      gaa = "git add -A";
      gc = "git commit";
      gp = "git push";

      # nix
      nfc = "nix flake check";
      nfu = "nix flake update";
      nd = "nix develop";
      nr = "nix run";
      ns = "nix shell";
      nhs = "nh os switch --ask ~/snowflake";
      nhsu = "nh os switch --ask --update ~/snowflake";
      nrs = "sudo nixos-rebuild switch --flake ~/snowflake";
      nrsu = "sudo nixos-rebuild switch --flake ~/snowflake --upgrade";

      # nvim
      nv = "nvim";

      # fetchies
      ff = "fastfetch";
      hf = "hyfetch";

      "-h" = {
        expansion = "-h | bat -Pplhelp";
        position = "anywhere";
        regex = "-h$";
      };
      "--help" = {
        expansion = "--help | bat -Pplhelp";
        position = "anywhere";
        regex = "--help$";
      };
    };
    interactiveShellInit = ''
      set -g fish_greeting
      set -g fish_transient_prompt 1
    '';
    shellInitLast = ''
      status is-interactive; and begin
        fastfetch
      end
    '';
  };
}

