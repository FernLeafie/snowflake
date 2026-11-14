{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.writing.obsidian;
in
{
  config = mkIf cfg.enable {
    programs.obsidian = {
      enable = true;
    };
  };
}
