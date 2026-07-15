{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.writing.obsidian.enable {
    programs.obsidian = {
      enable = true;
    };
  };
}
