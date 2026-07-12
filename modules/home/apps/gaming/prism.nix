{ lib, pkgs, osConfig, ... }:
{
  config = lib.mkIf osConfig.snow.gaming.prism.enable {
    programs.prismlauncher = {
      enable = true;
      settings = {
        ConsoleFont = "Maple Mono NF CN";
      };
    };
  };
}
