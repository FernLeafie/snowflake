{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.typst.enable =
      lib.mkEnableOption "typst tooling";
  };
  config = lib.mkIf config.snow.tooling.typst.enable {
    home.packages = with pkgs; [
      typst
      tinymist
    ];
  };
}
