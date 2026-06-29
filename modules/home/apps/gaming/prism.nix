{ config, lib, pkgs, ... }:
{
  options = {
    snow.gaming.prism.enable =
      lib.mkEnableOption "prismlauncher" // {
        default = true;
      };
  };
  config = lib.mkIf config.snow.gaming.prism.enable {
    programs.prismlauncher = {
      enable = true;
      settings = {
        ConsoleFont = "Maple Mono NF CN";
      };
    };
  };
}

