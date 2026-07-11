{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.typst.enable =
      lib.mkEnableOption "typst tooling" // {
        default = config.snow.tooling.enable;
      };
  };
  config = lib.mkIf config.snow.tooling.typst.enable {
    home.packages = with pkgs; [
      typst
      tinymist
    ];
    programs.nixvim.lsp.servers.tinymist.enable = true;
  };
}
