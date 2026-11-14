{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.gaming.prism;
in
{
  config = mkIf cfg.enable {
    programs.prismlauncher = {
      enable = true;
      settings = {
        ConsoleFont = "Maple Mono NF CN";
      };
    };
  };
}
