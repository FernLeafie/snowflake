{ config, lib, pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
        padding = {
          top = 3;
          left = 3;
        };
        color = {
          "1" = "blue";
          "2" = "black";
          "3" = "cyan";
          "4" = "green";
          "5" = "magenta";
          "6" = "red";
          "7" = "white";
          "8" = "yellow";
        };
      };
      display = {
        separator = " ";
        color.keys = "white";
      };
      modules = [
        {
          key = " ";
          type = "custom";
        }
        {
          key = "╭────────────╮";
          type = "custom";
        }
        {
          key = "│ {#31} user     {#keys}│";
          type = "title";
          format = "{full-user-name}";
        }
        {
          key = "│ {#32} hostname {#keys}│";
          type = "title";
          format = "{host-name}";
        }
        {
          key = "│ {#33} uptime   {#keys}│";
          type = "uptime";
        }
        {
          key = "│ {#34}{icon} distro   {#keys}│";
          type = "os";
          format = "{name} {arch}";
        }
        {
          key = "│ {#35} kernel   {#keys}│";
          type = "kernel";
          format = "{release}";
        }
        {
          key = "│ {#36} desktop  {#keys}│";
          type = "wm";
          format = "{pretty-name}";
        }
        {
          key = "│ {#31} term     {#keys}│";
          type = "terminal";
          format = "{pretty-name}";
        }
        {
          key = "│ {#32} shell    {#keys}│";
          type = "shell";
          format = "{pretty-name}";
        }
        {
          key = "│ {#35}󰏖 pkgs     {#keys}│";
          type = "packages";
          format = "{?apk}{#34}{apk}   {?}{?brew-all}{#33}{brew-all} 󱄖  {?}{?rpm}{#31}{rpm}   {?}{?dpkg}{#31}{dpkg}   {?}{?pacman}{#34}{pacman} 󰮯  {?}{?nix-all}{#36}{nix-all}   {?}{?flatpak-all}{#39}{flatpak-all}  {?}{?choco}{#34}{choco}   {?}{?scoop-user}{#35}{scoop-user}  {?}";
        }
        {
          key = "├────────────┤";
          type = "custom";
        }
        {
          key = "│ {#39} colors   {#keys}│ {#37} {#31} {#33} {#32} {#36} {#34} {#35} {#90}";
          type = "custom";
        }
        {
          key = "╰────────────╯";
          type = "custom";
        }
        {
          key = " ";
          type = "custom";
        }
      ];
    };
  };
  home.packages = with pkgs; [
    jq
  ];
  programs.fish = {
    functions = {
      fastfetch = {
        description = "Fastfetch with custom declared logos";
        body = ''
          argparse -i 'd/distro=&' -- $argv
          if set -ql _flag_d
              set -l _flag_d (echo $_flag_d | tr '[:upper:]' '[:lower:]' | sed "s/linux\$//g; s/gnu\$//g; s/os\$//g;")
              cat ~/.config/fastfetch/distros.json | jq (string join "" '.' $_flag_d '[]') -r | env fastfetch --file /dev/stdin $argv
          else
              cat ~/.config/fastfetch/distros.json | jq (string join "" '.' (grep -oP '(?<=^NAME=(")?)[^"]+(?=(")?$)' /etc/os-release | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z]//g; s/linux$//g; s/gnu$//g; s/os$//g') '[]') -r | command fastfetch --file /dev/stdin $argv
          end
        '';
      };
    };
  };

  # Imported so i dont have to work with two fileformats file restrictions at once
  xdg.configFile."fastfetch/distros.json".text = builtins.readFile ./distros.json;
}
