{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    hyfetch = {
      enable = true;
    };
    fish.functions.hyfetch = {
      description = "Hyfetch with custom logos and themeing";
      body = ''
        argparse -i 'd/distro=&' 't/theme=&' 'f/flag=&' -- $argv
        if set -ql _flag_f; and set -ql _flag_t
            set color (string join "" -- '-p ' (cat ~/.config/hyfetch/flags.json | jq (string join "" '.' $_flag_t '.' $_flag_f '[]')  -r | paste -sd ','))
        end
        if set -ql _flag_d
            set -l _flag_d (echo $_flag_d | tr '[:upper:]' '[:lower:]' | sed "s/linux\$//g; s/gnu\$//g; s/os\$//g;")
            cat ~/.config/fastfetch/distros.json | jq (string join "" '.' $_flag_d '[]') -r | sed "s/\$.//g" | command hyfetch --ascii-file=/dev/stdin $color $argv
        else
            cat ~/.config/fastfetch/distros.json | jq (string join "" '.' (grep -oP '(?<=^NAME=(")?)[^"]+(?=(")?$)' /etc/os-release | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z]//g; s/linux$//g; s/gnu$//g; s/os$//g') '[]') -r | sed "s/\$.//g" | command hyfetch --ascii-file=/dev/stdin $color $argv
        end
      '';
    };
  };

  home.packages = with pkgs; [
    jq
  ];

  # [NOTE] preferably in the future get whiskers to autogenerate this directly from the .tera
  xdg.configFile."hyfetch/flags.json".text = builtins.readFile ./flags.json;
}
